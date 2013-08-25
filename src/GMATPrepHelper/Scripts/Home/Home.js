$(function () {
    /// <summary>define the event bindings</summary>
    $('#btnBeginSession').on('click', functions.beginSession);
});


var functions = {
    beginSession: function() {
        console.log('Begin Session');
    }
};
