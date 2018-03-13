/*!

 =========================================================
 * Bootstrap Wizard - v1.1.1
 =========================================================
 
 * Product Page: https://www.creative-tim.com/product/bootstrap-wizard
 * Copyright 2017 Creative Tim (#)
 * Licensed under MIT (https://github.com/creativetimofficial/bootstrap-wizard/blob/master/LICENSE.md)
 
 =========================================================
 
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 */

// Get Shit Done Kit Bootstrap Wizard Functions

searchVisible = 0;
transparent = true;

$(document).ready(function () {

    /*  Activate the tooltips      */
    $('[rel="tooltip"]').tooltip();

    // Code for the Validator
    var $validator = $('.wizard-card form').validate({
        rules: {
            QQ: {
                required: true,
                minlength: 5,
                maxlength: 19,
                checkQQ: true
            },
            dormitory: {
                required: true,
                minlength: 5,
                maxlength: 8
            },
            phone: {
                required: true,
                minlength: 11,
                maxlength: 11,
                checkphone: true
            },
            specialty: {
                required: true,
                minlength: 3,
                maxlength: 10
            },
            name: {
                required: true,
                minlength: 2,
                maxlength: 10
            },
            std: {
                required: true,
                minlength: 7,
                maxlength: 13
            },
            introduce: {
                required: true
            },
            department: {
                required: true
            },
            img: {
                required: true
            },
            mail: {
                required: true,
                checkmail: true
            }
        },
        messages: {
            img: {
                required: "(必须上传)"
            },
            QQ: {
                required: "<small class='text-danger'>必填</small>",
                minlength: "<small class='text-danger'>长度至少为5</small>",
                maxlength: "<small class='text-danger'>长度不可超过19</small>"
            },
            mail: {
                required: "<small class='text-danger'>必填</small>"
            },
            dormitory: {
                required: "<small class='text-danger'>必填</small>",
                minlength: "<small class='text-danger'>长度至少为5</small>",
                maxlength: "<small class='text-danger'>长度不可超过8</small>"
            },
            phone: {
                required: "<small class='text-danger'>必填</small>",
                minlength: "<small class='text-danger'>长度至少为11</small>",
                maxlength: "<small class='text-danger'>长度不可超过11</small>"
            },
            specialty: {
                required: "<small class='text-danger'>必填</small>",
                minlength: "<small class='text-danger'>长度至少为3</small>",
                maxlength: "<small class='text-danger'>长度不可超过10</small>"
            },
            name: {
                required: "<small class='text-danger'>必填</small>",
                minlength: "<small class='text-danger'>长度至少为2</small>",
                maxlength: "<small class='text-danger'>长度不可超过10</small>"
            },
            std: {
                required: "<small class='text-danger'>必填</small>",
                minlength: "<small class='text-danger'>长度至少为7</small>",
                maxlength: "<small class='text-danger'>长度不可超过13</small>"
            },
            introduce: {
                required: "简介必填"
            },
            department: {
                required: "必须选择一个！"
            }
        },
        errorPlacement: function (error, element) { //错误信息位置设置方法
            if (element.attr("name") === "img") {
                error.appendTo($('#picture_error'));
            } else if (element.attr("name") === "department") {
                error.appendTo($('#department_error'));
            } else if (element.attr("name") === "introduce") {
                error.appendTo($('#introduce_error'));
            } else {
                element.before(error);
            }
        }
    });
    $.validator.addMethod("checkQQ", function (value, element, params) {
        var checkQQ = /^[1-9][0-9]{4,19}$/;
        return this.optional(element) || (checkQQ.test(value));
    }, "<small class='text-danger'>请输入正确的QQ号码！</small>");

    $.validator.addMethod("checkphone", function (value, element) {
        var tel = /^1[3578]\d{9}$/;
        return this.optional(element) || (tel.test(value));
    }, "<small class='text-danger'>手机号码格式错误</small>");

    $.validator.addMethod("checkmail", function (value, element) {
        var tel = /[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?/;
        return this.optional(element) || (tel.test(value));
    }, "<small class='text-danger'>邮箱格式错误</small>");

// Wizard Initialization
    $('.wizard-card').bootstrapWizard({
        'tabClass': 'nav nav-pills',
        'nextSelector': '.btn-next',
        'previousSelector': '.btn-previous',

        onNext: function (tab, navigation, index) {
            var $valid = $('.wizard-card form').valid();
            if (!$valid) {
                $validator.focusInvalid();
                return false;
            }
        },

        onInit: function (tab, navigation, index) {

            //check number of tabs and fill the entire row
            var $total = navigation.find('li').length;
            $width = 100 / $total;
            var $wizard = navigation.closest('.wizard-card');
            $display_width = $(document).width();

            if ($display_width < 600 && $total > 3) {
                $width = 50;
            }

            navigation.find('li').css('width', $width + '%');
            $first_li = navigation.find('li:first-child a').html();
            $moving_div = $('<div class="moving-tab">' + $first_li + '</div>');
            $('.wizard-card .wizard-navigation').append($moving_div);
            refreshAnimation($wizard, index);
            $('.moving-tab').css('transition', 'transform 0s');
        },

        onTabClick: function (tab, navigation, index) {

            var $valid = $('.wizard-card form').valid();

            if (!$valid) {
                return false;
            } else {
                return true;
            }
        },

        onTabShow: function (tab, navigation, index) {
            var $total = navigation.find('li').length;
            var $current = index + 1;

            var $wizard = navigation.closest('.wizard-card');

            // If it's the last tab then hide the last button and show the finish instead
            if ($current >= $total) {
                $($wizard).find('.btn-next').hide();
                $($wizard).find('.btn-finish').show();
            } else {
                $($wizard).find('.btn-next').show();
                $($wizard).find('.btn-finish').hide();
            }

            button_text = navigation.find('li:nth-child(' + $current + ') a').html();

            setTimeout(function () {
                $('.moving-tab').text(button_text);
            }, 150);

            var checkbox = $('.footer-checkbox');

            if (!index === 0) {
                $(checkbox).css({
                    'opacity': '0',
                    'visibility': 'hidden',
                    'position': 'absolute'
                });
            } else {
                $(checkbox).css({
                    'opacity': '1',
                    'visibility': 'visible'
                });
            }

            refreshAnimation($wizard, index);
        }
    });


// Prepare the preview for profile picture
    $("#wizard-picture").change(function () {
        readURL(this);
    });

    $('[data-toggle="wizard-radio"]').click(function () {
        wizard = $(this).closest('.wizard-card');
        wizard.find('[data-toggle="wizard-radio"]').removeClass('active');
        $(this).addClass('active');
        $(wizard).find('[type="radio"]').removeAttr('checked');
        $(this).find('[type="radio"]').attr('checked', 'true');
    });

    $('[data-toggle="wizard-checkbox"]').click(function () {
        if ($(this).hasClass('active')) {
            $(this).removeClass('active');
            $(this).find('[type="checkbox"]').removeAttr('checked');
        } else {
            $(this).addClass('active');
            $(this).find('[type="checkbox"]').attr('checked', 'true');
        }
    });

    $('.set-full-height').css('height', 'auto');

})
;


//Function to show image before upload

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            var picture = $('#wizardPicturePreview');
            picture.attr('src', e.target.result).fadeIn('slow');

        };

        reader.readAsDataURL(input.files[0]);
    }
}

$(window).resize(function () {
    $('.wizard-card').each(function () {
        $wizard = $(this);
        index = $wizard.bootstrapWizard('currentIndex');
        refreshAnimation($wizard, index);

        $('.moving-tab').css({
            'transition': 'transform 0s'
        });
    });
});

function refreshAnimation($wizard, index) {
    total_steps = $wizard.find('li').length;
    move_distance = $wizard.width() / total_steps;
    step_width = move_distance;
    move_distance *= index;

    $wizard.find('.moving-tab').css('width', step_width);
    $('.moving-tab').css({
        'transform': 'translate3d(' + move_distance + 'px, 0, 0)',
        'transition': 'all 0.3s ease-out'

    });
}

function debounce(func, wait, immediate) {
    var timeout;
    return function () {
        var context = this, args = arguments;
        clearTimeout(timeout);
        timeout = setTimeout(function () {
            timeout = null;
            if (!immediate) func.apply(context, args);
        }, wait);
        if (immediate && !timeout) func.apply(context, args);
    };
}
