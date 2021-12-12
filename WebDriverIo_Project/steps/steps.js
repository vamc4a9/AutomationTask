const { Given, When, Then } = require('@wdio/cucumber-framework');

const Selenium = require('../Lib/selenium.test');
const { default: AllureReporter } = require('@wdio/allure-reporter');

const WdioImageComparisonService = require('wdio-image-comparison-service').default;
let wdioImageComparisonService = new WdioImageComparisonService({})

Given(/^I open the \"(.*)\" url$/, async (url) => {
    await Selenium.open(url)
});

Given(/^close application$/, async () => {
    browser.closeWindow()
});

Given(/^I set the \"(.*)\" as current page$/, async (page) => {
    await Selenium.setCurrentPage(page)
});

Given(/^I check that \"(.*)\" control is displayed$/, async (sControl) => {
    await expect(Selenium.getControl(sControl)).toBeDisplayed();
});

Given(/^I click on \"(.*)\" control$/, async (sControl) => {
    await expect(Selenium.getControl(sControl)).toBeDisplayed();
    await expect(Selenium.getControl(sControl)).toBeClickable();
    await Selenium.getControl(sControl).click();
});

Given(/^verify below controls are displayed$/, async (table) => {
    var rows = await table.raw();
    
    for (const element of rows) {
        await expect(Selenium.getControl(element[0])).toBeDisplayed();
        AllureReporter.addStep("Verified " + element[0] + " control for existence");
    }    
});

Given(/^verify below controls contain given href$/, async (table) => {
    var rows = await table.raw();
    
    for (const element of rows) {
        await expect(Selenium.getControl(element[0])).toHaveHrefContaining(element[1]);
        AllureReporter.addStep("Verified " + element[0] + "'s href contains " + element[1]);
    }    
});

Given(/^I check if \"(.*)\" control contains below text$/, async (sControl, table) => {
    await expect(Selenium.getControl(sControl)).toBeDisplayed();
    var rows = await table.raw();
    for (const sMessage of rows) {
        await expect(Selenium.getControl(sControl)).toHaveTextContaining(sMessage[0]);
        AllureReporter.addStep("Verified that " + sControl + " contains the text " + sMessage[0]);
    }
});

When(/^Capture screenshot$/, async () => {
    await browser.takeScreenshot();
});

Then(/^I check that \"(.*)\" control is displayed with \"(.*)\"$/, async (sControl, sMessage) => {
    await expect(Selenium.getControl(sControl)).toBeDisplayed();
    await expect(Selenium.getControl(sControl)).toHaveTextContaining(sMessage);
});

Then(/^I capture the full page for baselining$/, async () => {
    wdioImageComparisonService.defaultOptions.autoSaveBaseline = true;
    browser.defaultOptions = wdioImageComparisonService.defaultOptions;
    browser.folders = wdioImageComparisonService.folders;
    wdioImageComparisonService.before(browser.capabilities)

    let fName = await Selenium.currentPage;
    await browser.saveFullPageScreen(fName, {});
});

Then(/^I capture \"(.*)\" control screenshot for baselining$/, async (sControl) => {
    wdioImageComparisonService.defaultOptions.autoSaveBaseline = true;
    browser.defaultOptions = wdioImageComparisonService.defaultOptions;
    browser.folders = wdioImageComparisonService.folders;
    wdioImageComparisonService.before(browser.capabilities)

    let fName = await Selenium.currentPage + "_" + sControl;
    browser.saveElement(Selenium.getControl(sControl), 'firstButtonElement', { /* some options */ });
    // await browser.saveElement(Selenium.getControl(sControl), fName, {});
    console.log("test")
});

Then(/^I check the the current page for visual differences$/, async () => {
    wdioImageComparisonService.defaultOptions.autoSaveBaseline = true;
    browser.defaultOptions = wdioImageComparisonService.defaultOptions;
    browser.folders = wdioImageComparisonService.folders;
    wdioImageComparisonService.before(browser.capabilities)

    let fName = await Selenium.currentPage;
    let iDiff = await browser.checkFullPageScreen(fName, {});
    expect(iDiff).toBeLessThan(13);
});

Then(/^I check that current page doesnt deviate much from baseline image visually, allowed difference is (\w+)$/, async (iExpectedDiff) => {
    wdioImageComparisonService.defaultOptions.autoSaveBaseline = true;
    browser.defaultOptions = wdioImageComparisonService.defaultOptions;
    browser.folders = wdioImageComparisonService.folders;
    wdioImageComparisonService.before(browser.capabilities)

    let fName = await Selenium.currentPage;
    let aDiff = await browser.checkFullPageScreen(fName, {});
    let xDiff = parseInt(iExpectedDiff);
    expect(aDiff).toBeLessThan(xDiff);
});