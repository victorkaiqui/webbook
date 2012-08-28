package br.com.webbook

import org.springframework.dao.DataIntegrityViolationException

class BookmarkController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bookmarkInstanceList: Bookmark.list(params), bookmarkInstanceTotal: Bookmark.count()]
    }

    def create() {
        [bookmarkInstance: new Bookmark(params)]
    }

    def save() {
        def bookmarkInstance = new Bookmark(params)
        if (!bookmarkInstance.save(flush: true)) {
            render(view: "create", model: [bookmarkInstance: bookmarkInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'bookmark.label', default: 'Bookmark'), bookmarkInstance.id])
        redirect(action: "show", id: bookmarkInstance.id)
    }

    def show(Long id) {
        def bookmarkInstance = Bookmark.get(id)
        if (!bookmarkInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bookmark.label', default: 'Bookmark'), id])
            redirect(action: "list")
            return
        }

        [bookmarkInstance: bookmarkInstance]
    }

    def edit(Long id) {
        def bookmarkInstance = Bookmark.get(id)
        if (!bookmarkInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bookmark.label', default: 'Bookmark'), id])
            redirect(action: "list")
            return
        }

        [bookmarkInstance: bookmarkInstance]
    }

    def update(Long id, Long version) {
        def bookmarkInstance = Bookmark.get(id)
        if (!bookmarkInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bookmark.label', default: 'Bookmark'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (bookmarkInstance.version > version) {
                bookmarkInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'bookmark.label', default: 'Bookmark')] as Object[],
                          "Another user has updated this Bookmark while you were editing")
                render(view: "edit", model: [bookmarkInstance: bookmarkInstance])
                return
            }
        }

        bookmarkInstance.properties = params

        if (!bookmarkInstance.save(flush: true)) {
            render(view: "edit", model: [bookmarkInstance: bookmarkInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'bookmark.label', default: 'Bookmark'), bookmarkInstance.id])
        redirect(action: "show", id: bookmarkInstance.id)
    }

    def delete(Long id) {
        def bookmarkInstance = Bookmark.get(id)
        if (!bookmarkInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bookmark.label', default: 'Bookmark'), id])
            redirect(action: "list")
            return
        }

        try {
            bookmarkInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'bookmark.label', default: 'Bookmark'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'bookmark.label', default: 'Bookmark'), id])
            redirect(action: "show", id: id)
        }
    }
}
