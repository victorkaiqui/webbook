package br.com.webbook

import org.springframework.dao.DataIntegrityViolationException

class FilterController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [filterInstanceList: Filter.list(params), filterInstanceTotal: Filter.count()]
    }

    def create() {
        [filterInstance: new Filter(params)]
    }

    def save() {
        def filterInstance = new Filter(params)
        if (!filterInstance.save(flush: true)) {
            render(view: "create", model: [filterInstance: filterInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'filter.label', default: 'Filter'), filterInstance.id])
        redirect(action: "show", id: filterInstance.id)
    }

    def show(Long id) {
        def filterInstance = Filter.get(id)
        if (!filterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'filter.label', default: 'Filter'), id])
            redirect(action: "list")
            return
        }

        [filterInstance: filterInstance]
    }

    def edit(Long id) {
        def filterInstance = Filter.get(id)
        if (!filterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'filter.label', default: 'Filter'), id])
            redirect(action: "list")
            return
        }

        [filterInstance: filterInstance]
    }

    def update(Long id, Long version) {
        def filterInstance = Filter.get(id)
        if (!filterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'filter.label', default: 'Filter'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (filterInstance.version > version) {
                filterInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'filter.label', default: 'Filter')] as Object[],
                          "Another user has updated this Filter while you were editing")
                render(view: "edit", model: [filterInstance: filterInstance])
                return
            }
        }

        filterInstance.properties = params

        if (!filterInstance.save(flush: true)) {
            render(view: "edit", model: [filterInstance: filterInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'filter.label', default: 'Filter'), filterInstance.id])
        redirect(action: "show", id: filterInstance.id)
    }

    def delete(Long id) {
        def filterInstance = Filter.get(id)
        if (!filterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'filter.label', default: 'Filter'), id])
            redirect(action: "list")
            return
        }

        try {
            filterInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'filter.label', default: 'Filter'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'filter.label', default: 'Filter'), id])
            redirect(action: "show", id: id)
        }
    }
}
