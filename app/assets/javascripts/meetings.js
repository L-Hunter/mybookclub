$(document).ready(function(e) {

    var $bookPreview = {
    	'thumb':  $('#book-preview-thumb'),
    	'title':  $('#book-meta-title'),
    	'author': $('#book-meta-author')
    }
    var $hiddenBookData = {
    	'title': $('#book-title'),
    	'author': $('#book-author'),
    	'image': $('#book-image'),
    	'description': $('#book-description')
    }

    function renderTitle(book) {
        if (!book || !book.volumeInfo) {
            return '<span>No results</span>';
        }
        return '<span>' + book.volumeInfo.title + '</span> - <span>' + book.volumeInfo.authors.join(', ') + '</span>'
    }

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
        //Set the hidden fields in the erb with this
        $hiddenBookData.title.val(e.params.data.volumeInfo.title);
        $hiddenBookData.author.val(e.params.data.volumeInfo.authors.join(', '));
        $hiddenBookData.image.val(e.params.data.volumeInfo.imageLinks.thumbnail);
        $hiddenBookData.description.val(e.params.data.volumeInfo.description);

        //Set the form preview once a book is set.
        $bookPreview.title.html(e.params.data.volumeInfo.title);
        $bookPreview.thumb.html(
        	$('<img src="'+e.params.data.volumeInfo.imageLinks.thumbnail+'" />'));
        $bookPreview.author.html(e.params.data.volumeInfo.authors.join(', '));

    });


});
