function frame(width, height, src, title) {


    this.width = width;

    this.height = height;

    this.src = src;

    this.title = title;
    
   
   
}

frame.prototype = {

    create: function() {


        new Dialog({

            Info: this.title,

            Width: this.width,

            Height: this.height,

            Left: ($(window).width() - this.width) / 2,

            Top: ($(window).height() - this.height) / 2 + $(window).scrollTop(),

            Content: $("<iframe>").attr("id", "log")

        });

        $("#log").attr("src", this.src);

    }

}