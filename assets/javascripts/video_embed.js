$(document).ready(function () {
    var commentArea = $('#notes');
    if (!commentArea.length) {
        return;
    }

    commentArea.on('dragover', function (e) {
        e.preventDefault();
        e.stopPropagation();
    });

    commentArea.on('drop', function (e) {
        e.preventDefault();
        e.stopPropagation();

        var files = e.originalEvent.dataTransfer.files;

        if (!files || files.length === 0) {
            return;
        }

        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var fileType = file.type;

            if (fileType.startsWith('video/')) {
                var reader = new FileReader();
                reader.onload = (function (file) {
                    return function (e) {
                        var embedCode = '!video(' + e.target.result + ')!';
                        commentArea.val(commentArea.val() + '\n' + embedCode);
                    };
                })(file);
                reader.readAsDataURL(file);
            }
        }
    });
});
