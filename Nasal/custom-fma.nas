# IT Autoflight V4.1.0 Custom FMA File
# Make sure you enable custom-fma in the config
# Copyright (c) 2026 Josh Davidson (Octal450)

var UpdateFma = {
	gsArm: 0,
	latText: "T/O",
	lnavArm: 0,
	locArm: 0,
	spdText: "PITCH",
	thrText: "THR LIM",
	vertText: "T/O CLB",
	thr: func() { # Called when speed/thrust modes change
		me.spdText = Text.spd.getValue();
		me.thrText = Text.thr.getValue();
	},
	arm: func() { # Called when armed modes change
		me.gsArm = Output.gsArm.getBoolValue();
		me.lnavArm = Output.lnavArm.getBoolValue();
		me.locArm = Output.locArm.getBoolValue();
		if (me.locArm and me.gsArm) {
			pts.Instrumentation.Pfd.apLatArm.setValue("LAND ARMED");
		} else if (me.locArm) {
			pts.Instrumentation.Pfd.apLatArm.setValue("LOC ARMED");
		} else if (me.lnavArm) {
			pts.Instrumentation.Pfd.apLatArm.setValue("NAV ARMED");
		} else {
			pts.Instrumentation.Pfd.apLatArm.setValue("");
		}
		if (me.gsArm and !me.locArm) {
			pts.Instrumentation.Pfd.apVertArm.setValue("LAND ARMED");
		} else {
			pts.Instrumentation.Pfd.apVertArm.setValue("");
		}
	},
	lat: func() { # Called when lateral mode changes
		me.latText = Text.lat.getValue();
		if (me.latText == "HDG") {
			if (Input.trk.getBoolValue()) {
				pts.Instrumentation.Pfd.apLat.setValue("TRACK " ~ sprintf("%03d", Input.hdg.getValue()));
			} else {
				pts.Instrumentation.Pfd.apLat.setValue("HEADING " ~ sprintf("%03d", Input.hdg.getValue()));
			}
		} else if (me.latText == "LNAV") {
			pts.Instrumentation.Pfd.apLat.setValue("NAV");
		} else if (me.latText == "LOC") {
			pts.Instrumentation.Pfd.apLat.setValue("LOC");
		} else if (me.latText == "ALIGN") {
			pts.Instrumentation.Pfd.apLat.setValue("ALIGN");
		} else if (me.latText == "T/O") {
			pts.Instrumentation.Pfd.apLat.setValue("TAKEOFF");
		} else if (me.latText == "ROLLOUT") {
			pts.Instrumentation.Pfd.apLat.setValue("ROLLOUT");
		} else if (me.latText == "ROLL") {
			pts.Instrumentation.Pfd.apLat.setValue("ROLL");
		}
	},
	vert: func() { # Called when vertical mode changes
		me.vertText = Text.vert.getValue();
		if (me.vertText == "ALT HLD") {
			pts.Instrumentation.Pfd.apVert.setValue("HOLD");
		} else if (me.vertText == "ALT CAP") {
			pts.Instrumentation.Pfd.apVert.setValue("HOLD");
		} else if (me.vertText == "V/S") {
			pts.Instrumentation.Pfd.apVert.setValue("V/S");
		} else if (me.vertText == "G/S") {
			pts.Instrumentation.Pfd.apVert.setValue("G/S");
		} else if (me.vertText == "SPD CLB") {
			pts.Instrumentation.Pfd.apVert.setValue("SPD CLB");
		} else if (me.vertText == "SPD DES") {
			pts.Instrumentation.Pfd.apVert.setValue("SPD DES");
		} else if (me.vertText == "FPA") {
			pts.Instrumentation.Pfd.apVert.setValue("FPA");
		} else if (me.vertText == "FLARE") {
			pts.Instrumentation.Pfd.apVert.setValue("FLARE");
		} else if (me.vertText == "ROLLOUT") {
			pts.Instrumentation.Pfd.apVert.setValue("ROLLOUT");
		} else if (me.vertText == "T/O CLB") {
			pts.Instrumentation.Pfd.apVert.setValue("TAKEOFF");
		} else if (me.vertText == "G/A CLB") {
			pts.Instrumentation.Pfd.apVert.setValue("GO AROUND");
		} else if (me.vertText == "PITCH") {
			pts.Instrumentation.Pfd.apVert.setValue("PITCH");
		}
	},
};

setlistener("/it-autoflight/input/hdg", func() {
	UpdateFma.lat();
}, 0, 0);

var altTemp = 10000;
setlistener("/it-autoflight/internal/alt", func() {
	altTemp = sprintf("%d", Internal.alt.getValue());
	pts.Instrumentation.Pfd.altFl.setValue(sprintf("%d", math.floor(altTemp / 1000)));
	pts.Instrumentation.Pfd.altHundred.setValue(right(altTemp, 3));
}, 0, 0);
