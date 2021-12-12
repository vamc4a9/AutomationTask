module.exports = class Elemtent {

    static getControl(sControl) {
        return $(sControl);
    }

    static ClickControl(sControl) {
        this.getControl(sControl).Click
    }

}