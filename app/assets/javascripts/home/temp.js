
ready = ->
    # Temporal Saving
    if $('.create-temp')
        window.tempTimer = null
        $('.blog-form form').keydown ->
            # reset
            window.clearTimeout(tempTimer)
            window.tempTimer = window.setTimeout ->
                tempSubmit()
            , 5000

tempSubmit = ->
    # create
    if $('.create-temp span').data('result') != true
        $(".blog-form").ajaxSubmit(
            url: '/posts/temp',
            type: 'post'
        )
    # update
    else
        $(".blog-form form").ajaxSubmit()

# For turbolinks
$(document).ready(ready)
$(document).on('page:load', ready)
