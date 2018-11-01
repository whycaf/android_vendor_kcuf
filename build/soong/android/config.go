package android

// Global config used by Kcuf soong additions
var KcufConfig = struct {
	// List of packages that are permitted
	// for java source overlays.
	JavaSourceOverlayModuleWhitelist []string
}{
	// JavaSourceOverlayModuleWhitelist
	[]string{
		"org.kcufos.hardware",
	},
}
