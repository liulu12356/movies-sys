let $ = (selector) => {
    console.log("自定义$");
    if (selector.startsWith("#")) return document.getElementById(selector.substring(1));
    if (selector.startsWith(".")) return document.getElementsByClassName(selector.substring(1));
    return document.getElementsByTagName(selector);
};