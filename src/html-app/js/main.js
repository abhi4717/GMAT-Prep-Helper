$(function () {
    // Binding initial values to drop down
    app.view.bindSectionDropdown();
    //app.view.bindSessionDate();

    // Event binding
	app.models.ele.btnSectionNext.on('click', app.controller.eventNext);
});
var app = {
    models: {
        ele: {
            ddSection: $('#ddSection')

            , btnSectionNext: $('#btnStart')

            , dtSectionDate: $('#txtDateTime')
            , txtBook: $('#txtBook')
            , txtQuesNo: $('#startQuestion')
			
			, lblDateTime: $('#lblDateTime')

        }
        , session: {
            book: ''
            , section: ''
            , date: ''
            , startQNo: ''
        }
    }
    , controller: {

        eventNext: function () {
            app.models.session.book = app.models.ele.txtBook.val();
            app.models.session.section = app.models.ele.ddSection.val();
            app.models.session.date = new Date();
            app.models.session.startQNo = app.models.ele.txtQuesNo.val();
        }

    }
    , view: {
        bindSectionDropdown: function () {
            var strDropdown = '';
            $.each(constant.section, function (index, obj) {
                strDropdown += '<option value=' + index + '> ' + obj + '</option>';
            });
            app.models.ele.ddSection.html(strDropdown);
        }
		
        //, bindSessionDate:  setInterval(app.view.showDateTime(), 1000)
        
        , showDateTime: function () {
            var temp = new Date();
            var strDate = temp.getDate() + '/' + temp.getMonth() + '/' + temp.getFullYear() + ' ' + temp.getHours() + ':' + temp.getMinutes() + ':' + temp.getSeconds();
            //app.models.ele.dtSectionDate.val(strDate);
			app.models.ele.lblDateTime.html(strDate);
        }

    }
};
var bindSessionDate = setInterval(app.view.showDateTime(), 1000);