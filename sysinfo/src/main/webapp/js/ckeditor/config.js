/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function(config) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.enterMode = CKEDITOR.ENTER_BR;
	config.shiftEnterMode = CKEDITOR.ENTER_P;
	config.height = 350;
	//处理图片请求
	config.toolbar = 'Full';
    config.toolbar_Full = [
       ['Bold','Underline','Strike','-','Subscript','Superscript'],
        ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
        ['Link','Unlink','Anchor'],
       ['Image','Table','HorizontalRule','SpecialChar','PageBreak'],
       '/',
        ['Styles','Format','Font','FontSize'],
        ['TextColor','BGColor']
    ];//自定义功能，应大佬要求，最好缩减到一行
	
	config.filebrowserUploadUrl="/bike-admin/upload/file";
};

