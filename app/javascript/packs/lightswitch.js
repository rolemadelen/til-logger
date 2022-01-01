document.addEventListener("turbolinks:load", function() {
  const githubIcons = $(".sns-github > a > img");

  let darkmode = localStorage.getItem('darkmode') === 'true';
  $(".eu\\:container").append('<div class="lightswitch"><span></span></div>');

  if(darkmode) {
    $('html').removeClass('dark');
    $('html').addClass('dark');
    $(".lightswitch > span").css('background-color', '#ff9898')
    githubIcons[0].classList.add('hide');
    githubIcons[1].classList.remove('hide');
  } else {
    $('html').removeClass('dark');
    $(".lightswitch > span").css('background-color', '#191b28')
    githubIcons[0].classList.remove('hide');
    githubIcons[1].classList.add('hide');
  }

  $('.lightswitch > span').on('click', () => {
    darkmode = !darkmode;
    $('html').toggleClass('dark');
    localStorage.setItem('darkmode', darkmode);

    if(darkmode) {
      $(".lightswitch > span").css('background-color', '#ff9898')
      githubIcons[0].classList.add('hide');
      githubIcons[1].classList.remove('hide');
    } else  {
      $(".lightswitch > span").css('background-color', '#191b28')
      githubIcons[0].classList.remove('hide');
      githubIcons[1].classList.add('hide');
    }
  });
});
