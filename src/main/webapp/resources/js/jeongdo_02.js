$(document).ready(function(){
    
    (function($) {
        "use strict";

    
    jQuery.validator.addMethod('answercheck', function (value, element) {
        return this.optional(element) || /^\bcat\b$/.test(value)
    }, "type the correct answer -_-");

    // validate contactForm form
    $(function() {
        $('#contactForm').validate({
            rules: {
                photo: {
                    required: true,
                    minlength: 2
                },
                subject: {
                    required: true,
                    minlength: 2
                },
                number: {
                    required: true,
                    minlength: 5
                },
                tags: {
                    required: true,
                    minlength: 2
                },
                message: {
                    required: true,
                    minlength: 20
                }
            },
            messages: {
                photo: {
                    required: "등록할 사진이 있나요?",
                    minlength: "등록할 사진이 있나요?"
                },
                subject: {
                    required: "제목을 입력해주세요.",
                    minlength: "2글자 이상 입력해주세요."
                },
                number: {
                    required: "come on, you have a number, don't you?",
                    minlength: "your Number must consist of at least 5 characters"
                },
                tags: {
                    required: "태그를 등록해주세요",
                    minlength: "2글자 이상 입력해주세요."
                },
                message: {
                    required: "내용을 입력해주세요",
                    minlength: "정말 더 이상 적을게 없나요?"
                }
            },
        })
    })
        
 })(jQuery)
})