define([ "jquery", "knockout", "bootstrap", "sidebar-collapse" ], function($, ko) {

	/*Menu-toggle*/
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("active");
        alert(1);
    });
});