#
# Copyright (C) 2010 The Android Open Source Project
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Makefile for producing kcuf sdk coverage reports.
# Run "make kcuf-sdk-test-coverage" in the $ANDROID_BUILD_TOP directory.

kcuf_sdk_api_coverage_exe := $(HOST_OUT_EXECUTABLES)/kcuf-sdk-api-coverage
dexdeps_exe := $(HOST_OUT_EXECUTABLES)/dexdeps

coverage_out := $(HOST_OUT)/kcuf-sdk-api-coverage

api_text_description := kcuf-sdk/api/kcuf_current.txt
api_xml_description := $(coverage_out)/api.xml
$(api_xml_description) : $(api_text_description) $(APICHECK)
	$(hide) echo "Converting API file to XML: $@"
	$(hide) mkdir -p $(dir $@)
	$(hide) $(APICHECK_COMMAND) -convert2xml $< $@

kcuf-sdk-test-coverage-report := $(coverage_out)/kcuf-sdk-test-coverage.html

kcuf_sdk_tests_apk := $(call intermediates-dir-for,APPS,KCUFPlatformTests)/package.apk
kcufsettingsprovider_tests_apk := $(call intermediates-dir-for,APPS,KCUFSettingsProviderTests)/package.apk
kcuf_sdk_api_coverage_dependencies := $(kcuf_sdk_api_coverage_exe) $(dexdeps_exe) $(api_xml_description)

$(kcuf-sdk-test-coverage-report): PRIVATE_TEST_CASES := $(kcuf_sdk_tests_apk) $(kcufsettingsprovider_tests_apk)
$(kcuf-sdk-test-coverage-report): PRIVATE_KCUF_SDK_API_COVERAGE_EXE := $(kcuf_sdk_api_coverage_exe)
$(kcuf-sdk-test-coverage-report): PRIVATE_DEXDEPS_EXE := $(dexdeps_exe)
$(kcuf-sdk-test-coverage-report): PRIVATE_API_XML_DESC := $(api_xml_description)
$(kcuf-sdk-test-coverage-report): $(kcuf_sdk_tests_apk) $(kcufsettingsprovider_tests_apk) $(kcuf_sdk_api_coverage_dependencies) | $(ACP)
	$(call generate-kcuf-coverage-report,"KCUF-SDK API Coverage Report",\
			$(PRIVATE_TEST_CASES),html)

.PHONY: kcuf-sdk-test-coverage
kcuf-sdk-test-coverage : $(kcuf-sdk-test-coverage-report)

# Put the test coverage report in the dist dir if "kcuf-sdk" is among the build goals.
ifneq ($(filter kcuf-sdk, $(MAKECMDGOALS)),)
  $(call dist-for-goals, kcuf-sdk, $(kcuf-sdk-test-coverage-report):kcuf-sdk-test-coverage-report.html)
endif

# Arguments;
#  1 - Name of the report printed out on the screen
#  2 - List of apk files that will be scanned to generate the report
#  3 - Format of the report
define generate-kcuf-coverage-report
	$(hide) mkdir -p $(dir $@)
	$(hide) $(PRIVATE_KCUF_SDK_API_COVERAGE_EXE) -d $(PRIVATE_DEXDEPS_EXE) -a $(PRIVATE_API_XML_DESC) -f $(3) -o $@ $(2) -cm
	@ echo $(1): file://$@
endef

# Reset temp vars
kcuf_sdk_api_coverage_dependencies :=
kcuf-sdk-combined-coverage-report :=
kcuf-sdk-combined-xml-coverage-report :=
kcuf-sdk-verifier-coverage-report :=
kcuf-sdk-test-coverage-report :=
api_xml_description :=
api_text_description :=
coverage_out :=
dexdeps_exe :=
kcuf_sdk_api_coverage_exe :=
kcuf_sdk_verifier_apk :=
android_kcuf_sdk_zip :=
