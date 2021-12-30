document.addEventListener("turbolinks:load", function() {
  $(".search-input").on('change', (e) => {
    const param = (e.target.value).trimStart().trimEnd();
    const URL = "/index/" + encodeURIComponent(param);

    console.log(URL);
    $.ajax({
      url: URL,
      success: function(data) {
        console.log('success')
      },
      error: function() {
        console.log('failure')
      }
    });
  })
});
