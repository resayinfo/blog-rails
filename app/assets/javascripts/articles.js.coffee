# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

  # to set summernote object
  # You should change '#post_content' to your textarea input id
  summer_note = $('.summernote')
  console.log('init summernote: ' + summer_note.length)

  # to call summernote editor
  summer_note.summernote
    # to set options
    height:540
    lang: 'en-US'

    toolbar: [
      ['style', ['style']]
      ['font', ['bold', 'italic', 'underline', 'clear']]
      ['fontname', ['fontname']]
      ['color', ['color']]
      ['para', ['ul', 'ol', 'paragraph']]
      ['height', ['height']]
      ['table', ['table']]
      ['insert', ['link', 'video', 'picture', 'hr']]
      ['view', ['fullscreen', 'codeview']]
      ['help', ['help']]
    ]

    codemirror:
      lineNumbers: true
      tabSize: 2
      theme: "solarized light"

  # to set code for summernote
  summer_note.code summer_note.val()

  # to get code for summernote
  summer_note.closest('form').submit ->
    # alert $('#post_content').code()
    summer_note.val summer_note.code()
    true
