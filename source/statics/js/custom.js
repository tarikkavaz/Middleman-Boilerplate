$(document).ready(function () {
    $('.fancybox').fancybox();
    $('[data-toggle="tooltip"]').tooltip();
    $("[data-toggle=popover]").popover({
        trigger: 'focus'
    })

    // JSON data sample
    fetch('https://newtablab.com/test/db.json')
    .then(response => response.json())
    .then(data => {
        data.posts.map(item => {
            $('#remote-posts').append(`<li>${item.id} - ${item.title}</li>`);
        });
        data.fruits.map(item => {
            $('#remote-fruits').append(`<li>${item}</li>`);
        });
        data.people.map(item => {
            $('#remote-people').append(`<li>${item}</li>`);
        });
    });
});