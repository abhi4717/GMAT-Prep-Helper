$(function () {
    // Binding initial values to drop down
    app.view.bindSectionDropdown();

    // Event binding
	app.models.ele.btnSectionNext.on('click', app.controller.eventNext);
});
var app = {
    models: {
        ele: {
            ddSection: $('#ddSection')

            , btnSectionNext: $('#btnStart')

            , txtBook: $('#txtBook')
            , txtQuesNo: $('#startQuestion')

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
            app.controllers.bindSessionObject();
			app.controllers.disableSessionControls();
        }
		
		, validateSessionControls : function(){
			// to do: incorporate a jquery validator for the controls
		}
		
		, bindSessionObject: function(){
			app.models.session.book = app.models.ele.txtBook.val();
            app.models.session.section = app.models.ele.ddSection.val();
            app.models.session.date = new Date();
            app.models.session.startQNo = app.models.ele.txtQuesNo.val();
		}
		
		, disableSessionControls: function(){
			app.models.ele.ddSection.attr('disabled','disabled');
			app.models.ele.txtBook.attr('disabled','disabled');
			app.models.ele.txtQuesNo.attr('disabled','disabled');
		}
		
		, moveAnswerSection: function(){
			// to do: refer twitter bootstrap to activate tabs from javascript
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
    }
};
