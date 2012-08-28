package br.com.webbook



import org.junit.*
import grails.test.mixin.*

@TestFor(BookmarkController)
@Mock(Bookmark)
class BookmarkControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/bookmark/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.bookmarkInstanceList.size() == 0
        assert model.bookmarkInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.bookmarkInstance != null
    }

    void testSave() {
        controller.save()

        assert model.bookmarkInstance != null
        assert view == '/bookmark/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/bookmark/show/1'
        assert controller.flash.message != null
        assert Bookmark.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/bookmark/list'

        populateValidParams(params)
        def bookmark = new Bookmark(params)

        assert bookmark.save() != null

        params.id = bookmark.id

        def model = controller.show()

        assert model.bookmarkInstance == bookmark
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/bookmark/list'

        populateValidParams(params)
        def bookmark = new Bookmark(params)

        assert bookmark.save() != null

        params.id = bookmark.id

        def model = controller.edit()

        assert model.bookmarkInstance == bookmark
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/bookmark/list'

        response.reset()

        populateValidParams(params)
        def bookmark = new Bookmark(params)

        assert bookmark.save() != null

        // test invalid parameters in update
        params.id = bookmark.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/bookmark/edit"
        assert model.bookmarkInstance != null

        bookmark.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/bookmark/show/$bookmark.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        bookmark.clearErrors()

        populateValidParams(params)
        params.id = bookmark.id
        params.version = -1
        controller.update()

        assert view == "/bookmark/edit"
        assert model.bookmarkInstance != null
        assert model.bookmarkInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/bookmark/list'

        response.reset()

        populateValidParams(params)
        def bookmark = new Bookmark(params)

        assert bookmark.save() != null
        assert Bookmark.count() == 1

        params.id = bookmark.id

        controller.delete()

        assert Bookmark.count() == 0
        assert Bookmark.get(bookmark.id) == null
        assert response.redirectedUrl == '/bookmark/list'
    }
}
