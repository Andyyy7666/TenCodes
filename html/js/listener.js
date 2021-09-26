$(document).ready(function(){
    // Hide/show ui function.
    function display(bool) {
        if (bool) {
            $("#overlay").show();
        } else {
            $("#overlay").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        // open ui
        if (item.type === "open") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }

        if (item.page === "page1") {
            $(".page1").show();
            $(".page2").hide();
            $(".page3").hide();
        } else if (item.page === "page2") {
            $(".page1").hide();
            $(".page2").show();
            $(".page3").hide();
        } else if (item.page === "page3") {
            $(".page1").hide();
            $(".page2").hide();
            $(".page3").show();
        }
    });

    /**
    $("#LegHolster").click(function () {
        $.post('http://WAM2/9', JSON.stringify({}));
        return
    })
    */

    // Close ui when ESC is pressed
    document.onkeyup = function(data) {
        if (data.which == 27) {
            $.post('http://TenCodes/close', JSON.stringify({}));
            return
        }
    };
});