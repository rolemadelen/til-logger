document.addEventListener("turbolinks:load", function() {
  $(".search-input").on('keydown', (e) => {
    const param = (e.target.value).trimStart().trimEnd();
    const URL = "/index/" + encodeURIComponent(param);

    $.ajax({
      url: URL,
      success: function(data) {
        console.log('success')
        $(".mainlist > li.archive").on('mouseenter', (e) => {
          e.currentTarget.lastElementChild.classList.remove("hide");
        })
        $(".mainlist > li.archive").on('mouseleave', (e) => {
          e.currentTarget.lastElementChild.classList.add("hide");
        })
      },
      error: function() {
        console.log('failure')
      }
    });
  })
});
