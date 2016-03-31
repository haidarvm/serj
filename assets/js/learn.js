 //jquery user validation      
          jQuery(function($) {
                    $.validator.setDefaults({
                        submitHandler: function () {
                      	  $(form).submit();
                        }
           
                    });
           
                    $().ready(function () {
                        // 
                        $("#validation-reg").validate({
                            errorElement: 'div',
                            errorClass: 'help-block',
                            focusInvalid: false,
                            rules: {
                                 full_name: {
                                    required: true
                                },
                                password: {
                                    required: true,
                                    minlength: 5
                                },
                                re_password: {
                                    required: true,
                                    minlength: 5,
                                    equalTo: "#password"
                                },
                                email: {
                                    required: true
                                },
                                phone: {
                                    required: false
                                },
                            },
           
                            messages: {
                                password: {
                                    required: "Mohon di isi password.",
                                    minlength: "minimal password 5 karakter."
                                },
                                full_name: "Mohon isi nama lengkap anda"
                            },
           
                            highlight: function (e) {
                                $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
                            },
           
                            success: function (e) {
                                $(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
                                $(e).remove();
                            }
           
                        })
                    });
                });
          
       // For Pendidikan Atlet Admin 
          $(function () {
          	$("#date_birth").datepicker({format: 'dd-mm-yyyy'});

          });
          	
          	
          	
          