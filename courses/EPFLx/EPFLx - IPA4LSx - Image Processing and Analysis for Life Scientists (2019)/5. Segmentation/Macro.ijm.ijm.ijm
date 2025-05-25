run("Set Measurements...", "area display redirect=None decimal=3");
run("Duplicate...", "duplicate channels=2");
run("Median...", "radius=2");
setAutoThreshold("Otsu dark");
setOption("BlackBackground", false);
run("Convert to Mask");
run("Watershed");