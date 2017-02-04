$(document).ready(function(e) {

    var $bookPreview = {
    	'thumb':  $('#book-preview-thumb'),
    	'title':  $('#book-meta-title'),
    	'author': $('#book-meta-author'),
    	'description': $('#book-meta-description')
    }
    var $hiddenBookData = {
    	'title': $('#book-title'),
    	'author': $('#book-author'),
    	'image': $('#book-image'),
    	'description': $('#book-description')
    }

    //info displayed in search box
    function renderTitle(book) {
        if (!book || !book.volumeInfo) {
            return '<span>No results</span>';
        }
        return '<span>' + book.volumeInfo.title + '</span> by <span>' + book.volumeInfo.authors.join(', ') + '</span>'
    }
    //displays renderTitle with book cover in search options
    function renderBook(book) {
        if (!book || !book.volumeInfo) {
            return $('<span>No results</span>');
        }
        var $result = $(
            '<div class="row">' + '<div class="col-lg-4"><img class="thumbnail" src="' + book.volumeInfo.imageLinks.thumbnail + '"/></div>' + '<div class="col-lg-8">' + renderTitle(book) + '</div>'
            + '</div>'
        );
        return $result;
    };

    //select2 search feature
    $booksearch = $('#booksearch').select2({
        ajax: {
            url: function(params) {
                return "https://www.googleapis.com/books/v1/volumes";
            },
            dataType: 'json',
            delay: 250,
            data: function(params) {
                return {
                    q: params.term
                };
            },
            processResults: function(data, params) {
                // parse the results into the format expected by Select2
                // since we are using custom formatting functions we do not need to
                // alter the remote JSON data, except to indicate that infinite
                // scrolling can be used
                // params.page = params.page || 1;

                return {
                    results: data.items,
                    // pagination: {
                    //   more: (params.page * 30) < data.total_count
                    // }
                };
            },
            cache: true
        },
        escapeMarkup: function(markup) {
            return markup; }, // let our custom formatter work
        minimumInputLength: 1,
        templateResult: renderBook,
        templateSelection: renderTitle

    });


    $booksearch.on("select2:select", function(e) {
        // Create your hidden fields
        console.log("select2:select", e.params.data);
        console.log("select2:select", e.params.data.volumeInfo.title);
        //Set the hidden fields
        $hiddenBookData.title.val(e.params.data.volumeInfo.title);
        $hiddenBookData.author.val(e.params.data.volumeInfo.authors.join(', '));
        $hiddenBookData.image.val(e.params.data.volumeInfo.imageLinks.thumbnail);
        $hiddenBookData.description.val(e.params.data.volumeInfo.description);
        
        // $("#book-title").val($hiddenBookData.title)
        // $("#book-author").val($hiddenBookData.author)
        // $("#book-image").val($hiddenBookData.image)
        // $("#book-description").val($hiddenBookData.description)
        $("#book-title").val(e.params.data.volumeInfo.title)
        $("#book-author").val(e.params.data.volumeInfo.authors.join(', '))
        $("#book-image").val(e.params.data.volumeInfo.imageLinks.thumbnail)
        $("#book-description").val(e.params.data.volumeInfo.description)
        
        //Set the form preview once a book is selected
        $bookPreview.title.html(e.params.data.volumeInfo.title);
        $bookPreview.thumb.html(
        	$('<img src="'+e.params.data.volumeInfo.imageLinks.thumbnail+'" />'));
        $bookPreview.author.html(e.params.data.volumeInfo.authors.join(', '));
        $bookPreview.description.html(e.params.data.volumeInfo.description);

    });


});
