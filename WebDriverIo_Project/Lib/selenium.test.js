const fs = require('fs');
const { removeSync } = require('fs-extra');
const jp = require('jsonpath');
let objDetails = require( '../OR/ObjRepo.json');
const Element = require('./elements');
const { default: AllureReporter } = require('@wdio/allure-reporter');
const moment = require('moment');
const WdioImageComparisonService = require('wdio-image-comparison-service').default;
let wdioImageComparisonService = new WdioImageComparisonService({})

module.exports = class Selenium {
    
    static currentPage = "";
    static controlName = "";

    static async getScreenshot() {
        await browser.takeScreenshot();
    }

    static setCurrentPage(sPage) {
        this.currentPage = sPage;
    }

    static open(path) {
        return browser.url(`/${path}`)
    }

    static getControl (sObjName) {
        let sJsonPath = "$..".concat(this.currentPage).concat("..").concat(sObjName);
        var queryResults = jp.query(objDetails, sJsonPath);
        return Element.getControl(queryResults[0]);
    }

    static checkIfControlExist(sControl) {
        expect(this.getControl(sControl)).toBeExisting();
    }

    static click(sControl) {
        Element.ClickControl(sControl);
    }

    static sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }

    static setFocus(sControl) {

        browser.addCommand('focus', function () {
            browser.execute(function (domElement) {
                domElement.focus();
            }, this);
        }, true);

        this.getControl(sControl).focus();
        // browser.moveToElement(this.getControl(sControl), 1, 1)
        // browser.execute(({value}) => value.focus(), this.getControl(sControl))
        // this.getControl(sControl).focus();
    }

}