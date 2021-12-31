document.addEventListener("turbolinks:load", function() {
  $(".mainlist > li.archive").on('mouseenter', (e) => {
    e.currentTarget.lastElementChild.classList.remove("hide");
  })
  $(".mainlist > li.archive").on('mouseleave', (e) => {
    e.currentTarget.lastElementChild.classList.add("hide");
  })
});
