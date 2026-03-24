{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 2,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 127.0, 139.0, 1000.0, 687.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 396.6666666666667, 235.0, 55.0, 22.0 ],
                    "text": "adc~ 5 6"
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "newobj",
                    "numinlets": 7,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 2,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "box",
                        "rect": [ 439.0, 100.0, 1000.0, 687.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-7",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 75.0, 236.0, 55.0, 22.0 ],
                                    "text": "*~"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-100",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 271.0, 1031.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-101",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 921.5574238981519, 994.0, 122.0, 22.0 ],
                                    "text": "expr pow(10\\, $f1/20.)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-102",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 686.4145667552948, 1256.0, 71.5, 22.0 ],
                                    "text": "biquad~"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-103",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 955.4145667552948, 1031.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-104",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 887.700281041009, 1031.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "domain": [ 20.0, 16000.0 ],
                                    "fontface": 0,
                                    "id": "obj-105",
                                    "maxclass": "filtergraph~",
                                    "nfilters": 1,
                                    "numinlets": 8,
                                    "numoutlets": 7,
                                    "outlettype": [ "list", "float", "float", "float", "float", "list", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 718.4145667552948, 1086.0, 256.0, 128.0 ],
                                    "setfilter": [ 0, 5, 1, 0, 0, 5000.0, 1.0, 0.30000001192092896, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-106",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 237.0, 994.0, 122.0, 22.0 ],
                                    "text": "expr pow(10\\, $f1/20.)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-107",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 13.0, 1256.0, 71.5, 22.0 ],
                                    "text": "biquad~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-108",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 204.0, 1031.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "domain": [ 20.0, 16000.0 ],
                                    "fontface": 0,
                                    "id": "obj-109",
                                    "maxclass": "filtergraph~",
                                    "nfilters": 1,
                                    "numinlets": 8,
                                    "numoutlets": 7,
                                    "outlettype": [ "list", "float", "float", "float", "float", "list", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 34.0, 1086.0, 256.0, 128.0 ],
                                    "setfilter": [ 0, 5, 1, 0, 0, 5000.0, 1.0, 0.30000001192092896, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 ]
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-90",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 282.0, 706.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-91",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 909.6334925413132, 667.0, 122.0, 22.0 ],
                                    "text": "expr pow(10\\, $f1/20.)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-92",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 686.4145667552948, 941.0, 71.5, 22.0 ],
                                    "text": "biquad~"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-93",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 943.4906353984561, 706.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-94",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 876.0, 706.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "domain": [ 20.0, 16000.0 ],
                                    "fontface": 0,
                                    "id": "obj-95",
                                    "maxclass": "filtergraph~",
                                    "nfilters": 1,
                                    "numinlets": 8,
                                    "numoutlets": 7,
                                    "outlettype": [ "list", "float", "float", "float", "float", "list", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 706.4906353984561, 758.0, 256.0, 128.0 ],
                                    "setfilter": [ 0, 5, 1, 0, 0, 1000.0, 1.0, 0.30000001192092896, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-96",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 248.0, 667.0, 122.0, 22.0 ],
                                    "text": "expr pow(10\\, $f1/20.)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-97",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 13.0, 941.0, 71.5, 22.0 ],
                                    "text": "biquad~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-98",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 214.0, 706.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "domain": [ 20.0, 16000.0 ],
                                    "fontface": 0,
                                    "id": "obj-99",
                                    "maxclass": "filtergraph~",
                                    "nfilters": 1,
                                    "numinlets": 8,
                                    "numoutlets": 7,
                                    "outlettype": [ "list", "float", "float", "float", "float", "list", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 45.0, 758.0, 256.0, 128.0 ],
                                    "setfilter": [ 0, 5, 1, 0, 0, 1000.0, 1.0, 0.30000001192092896, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 ]
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-88",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 273.0, 369.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-83",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 909.6334925413132, 331.90064322948456, 122.0, 22.0 ],
                                    "text": "expr pow(10\\, $f1/20.)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-84",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 686.4145667552948, 595.0, 71.5, 22.0 ],
                                    "text": "biquad~"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-85",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 943.4906353984561, 369.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-86",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 875.7763496841703, 369.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "domain": [ 20.0, 16000.0 ],
                                    "fontface": 0,
                                    "id": "obj-87",
                                    "maxclass": "filtergraph~",
                                    "nfilters": 1,
                                    "numinlets": 8,
                                    "numoutlets": 7,
                                    "outlettype": [ "list", "float", "float", "float", "float", "list", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 706.4906353984561, 412.0515956878662, 256.0, 128.0 ],
                                    "setfilter": [ 0, 5, 1, 0, 0, 70.0, 1.0, 0.30000001192092896, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-82",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 239.14285714285714, 331.90064322948456, 122.0, 22.0 ],
                                    "text": "expr pow(10\\, $f1/20.)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-80",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 15.0, 595.0, 71.5, 22.0 ],
                                    "text": "biquad~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-77",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 205.28571428571428, 369.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "domain": [ 20.0, 16000.0 ],
                                    "fontface": 0,
                                    "id": "obj-75",
                                    "maxclass": "filtergraph~",
                                    "nfilters": 1,
                                    "numinlets": 8,
                                    "numoutlets": 7,
                                    "outlettype": [ "list", "float", "float", "float", "float", "list", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 36.0, 412.0515956878662, 256.0, 128.0 ],
                                    "setfilter": [ 0, 5, 1, 0, 0, 70.0, 1.0, 0.30000001192092896, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-56",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 195.0, 189.0, 31.0, 22.0 ],
                                    "text": "sig~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-55",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 195.0, 136.0, 123.0, 22.0 ],
                                    "text": "expr sin($f1 * 1.5708)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-53",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 51.0, 189.0, 31.0, 22.0 ],
                                    "text": "sig~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-52",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 51.0, 136.0, 127.0, 22.0 ],
                                    "text": "expr cos($f1 * 1.5708)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-51",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 15.0, 236.0, 55.0, 22.0 ],
                                    "text": "*~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-49",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 195.0, 85.0, 97.0, 22.0 ],
                                    "text": "expr ($f1 + 1) / 2"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-22",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 686.4145667552948, 1318.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-21",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 13.0, 1318.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-6",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 75.0, 85.0, 29.5, 22.0 ],
                                    "text": "*~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-5",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 15.0, 85.0, 29.5, 22.0 ],
                                    "text": "*~"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-4",
                                    "index": 7,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 345.0, 15.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-3",
                                    "index": 6,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 296.5, 15.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-2",
                                    "index": 5,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 244.0, 15.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-1",
                                    "index": 4,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 195.0, 15.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-25",
                                    "index": 3,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 139.0, 11.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-24",
                                    "index": 2,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 75.0, 15.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-23",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 15.0, 15.0, 25.0, 25.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-49", 0 ],
                                    "source": [ "obj-1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-109", 7 ],
                                    "source": [ "obj-100", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-105", 6 ],
                                    "source": [ "obj-101", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-22", 0 ],
                                    "source": [ "obj-102", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-105", 7 ],
                                    "source": [ "obj-103", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-105", 5 ],
                                    "source": [ "obj-104", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-102", 5 ],
                                    "order": 0,
                                    "source": [ "obj-105", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-102", 4 ],
                                    "order": 1,
                                    "source": [ "obj-105", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-102", 3 ],
                                    "order": 2,
                                    "source": [ "obj-105", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-102", 2 ],
                                    "order": 3,
                                    "source": [ "obj-105", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-102", 1 ],
                                    "order": 4,
                                    "source": [ "obj-105", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-109", 6 ],
                                    "source": [ "obj-106", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-21", 0 ],
                                    "source": [ "obj-107", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-109", 5 ],
                                    "source": [ "obj-108", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-107", 5 ],
                                    "order": 0,
                                    "source": [ "obj-109", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-107", 4 ],
                                    "order": 1,
                                    "source": [ "obj-109", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-107", 3 ],
                                    "order": 2,
                                    "source": [ "obj-109", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-107", 2 ],
                                    "order": 3,
                                    "source": [ "obj-109", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-107", 1 ],
                                    "order": 4,
                                    "source": [ "obj-109", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-82", 0 ],
                                    "order": 1,
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-83", 0 ],
                                    "order": 0,
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "source": [ "obj-23", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-6", 0 ],
                                    "source": [ "obj-24", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 1 ],
                                    "order": 1,
                                    "source": [ "obj-25", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-6", 1 ],
                                    "order": 0,
                                    "source": [ "obj-25", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-91", 0 ],
                                    "order": 0,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-96", 0 ],
                                    "order": 1,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-101", 0 ],
                                    "order": 0,
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-106", 0 ],
                                    "order": 1,
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-52", 0 ],
                                    "order": 1,
                                    "source": [ "obj-49", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-55", 0 ],
                                    "order": 0,
                                    "source": [ "obj-49", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-51", 0 ],
                                    "source": [ "obj-5", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-80", 0 ],
                                    "source": [ "obj-51", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-53", 0 ],
                                    "source": [ "obj-52", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-51", 1 ],
                                    "source": [ "obj-53", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-56", 0 ],
                                    "source": [ "obj-55", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-7", 1 ],
                                    "source": [ "obj-56", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-7", 0 ],
                                    "source": [ "obj-6", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-84", 0 ],
                                    "source": [ "obj-7", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-80", 5 ],
                                    "order": 0,
                                    "source": [ "obj-75", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-80", 4 ],
                                    "order": 1,
                                    "source": [ "obj-75", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-80", 3 ],
                                    "order": 2,
                                    "source": [ "obj-75", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-80", 2 ],
                                    "order": 3,
                                    "source": [ "obj-75", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-80", 1 ],
                                    "order": 4,
                                    "source": [ "obj-75", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-75", 5 ],
                                    "source": [ "obj-77", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-97", 0 ],
                                    "source": [ "obj-80", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-75", 6 ],
                                    "source": [ "obj-82", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-87", 6 ],
                                    "source": [ "obj-83", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-92", 0 ],
                                    "source": [ "obj-84", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-87", 7 ],
                                    "source": [ "obj-85", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-87", 5 ],
                                    "source": [ "obj-86", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-84", 5 ],
                                    "order": 0,
                                    "source": [ "obj-87", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-84", 4 ],
                                    "order": 1,
                                    "source": [ "obj-87", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-84", 3 ],
                                    "order": 2,
                                    "source": [ "obj-87", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-84", 2 ],
                                    "order": 3,
                                    "source": [ "obj-87", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-84", 1 ],
                                    "order": 4,
                                    "source": [ "obj-87", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-75", 7 ],
                                    "source": [ "obj-88", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-99", 7 ],
                                    "source": [ "obj-90", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-95", 6 ],
                                    "source": [ "obj-91", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-102", 0 ],
                                    "source": [ "obj-92", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-95", 7 ],
                                    "source": [ "obj-93", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-95", 5 ],
                                    "source": [ "obj-94", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-92", 5 ],
                                    "order": 0,
                                    "source": [ "obj-95", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-92", 4 ],
                                    "order": 1,
                                    "source": [ "obj-95", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-92", 3 ],
                                    "order": 2,
                                    "source": [ "obj-95", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-92", 2 ],
                                    "order": 3,
                                    "source": [ "obj-95", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-92", 1 ],
                                    "order": 4,
                                    "source": [ "obj-95", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-99", 6 ],
                                    "source": [ "obj-96", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-107", 0 ],
                                    "source": [ "obj-97", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-99", 5 ],
                                    "source": [ "obj-98", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-97", 5 ],
                                    "order": 0,
                                    "source": [ "obj-99", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-97", 4 ],
                                    "order": 1,
                                    "source": [ "obj-99", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-97", 3 ],
                                    "order": 2,
                                    "source": [ "obj-99", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-97", 2 ],
                                    "order": 3,
                                    "source": [ "obj-99", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-97", 1 ],
                                    "order": 4,
                                    "source": [ "obj-99", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 396.6666666666667, 297.0, 146.0, 22.0 ],
                    "text": "p processing"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 218.66666666666669, 235.0, 55.0, 22.0 ],
                    "text": "adc~ 3 4"
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "newobj",
                    "numinlets": 7,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 2,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "box",
                        "rect": [ 439.0, 100.0, 1000.0, 687.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-7",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 90.0, 251.0, 55.0, 22.0 ],
                                    "text": "*~"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-100",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 286.0, 1046.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-101",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 936.5574238981519, 1009.0, 122.0, 22.0 ],
                                    "text": "expr pow(10\\, $f1/20.)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-102",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 701.4145667552948, 1271.0, 71.5, 22.0 ],
                                    "text": "biquad~"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-103",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 970.4145667552948, 1046.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-104",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 902.700281041009, 1046.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "domain": [ 20.0, 16000.0 ],
                                    "fontface": 0,
                                    "id": "obj-105",
                                    "maxclass": "filtergraph~",
                                    "nfilters": 1,
                                    "numinlets": 8,
                                    "numoutlets": 7,
                                    "outlettype": [ "list", "float", "float", "float", "float", "list", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 733.4145667552948, 1101.0, 256.0, 128.0 ],
                                    "setfilter": [ 0, 5, 1, 0, 0, 5000.0, 1.0, 0.30000001192092896, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-106",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 252.0, 1009.0, 122.0, 22.0 ],
                                    "text": "expr pow(10\\, $f1/20.)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-107",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 28.0, 1271.0, 71.5, 22.0 ],
                                    "text": "biquad~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-108",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 219.0, 1046.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "domain": [ 20.0, 16000.0 ],
                                    "fontface": 0,
                                    "id": "obj-109",
                                    "maxclass": "filtergraph~",
                                    "nfilters": 1,
                                    "numinlets": 8,
                                    "numoutlets": 7,
                                    "outlettype": [ "list", "float", "float", "float", "float", "list", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 49.0, 1101.0, 256.0, 128.0 ],
                                    "setfilter": [ 0, 5, 1, 0, 0, 5000.0, 1.0, 0.30000001192092896, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 ]
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-90",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 297.0, 721.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-91",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 924.6334925413132, 682.0, 122.0, 22.0 ],
                                    "text": "expr pow(10\\, $f1/20.)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-92",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 701.4145667552948, 956.0, 71.5, 22.0 ],
                                    "text": "biquad~"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-93",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 958.4906353984561, 721.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-94",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 891.0, 721.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "domain": [ 20.0, 16000.0 ],
                                    "fontface": 0,
                                    "id": "obj-95",
                                    "maxclass": "filtergraph~",
                                    "nfilters": 1,
                                    "numinlets": 8,
                                    "numoutlets": 7,
                                    "outlettype": [ "list", "float", "float", "float", "float", "list", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 721.4906353984561, 773.0, 256.0, 128.0 ],
                                    "setfilter": [ 0, 5, 1, 0, 0, 1000.0, 1.0, 0.30000001192092896, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-96",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 263.0, 682.0, 122.0, 22.0 ],
                                    "text": "expr pow(10\\, $f1/20.)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-97",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 28.0, 956.0, 71.5, 22.0 ],
                                    "text": "biquad~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-98",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 229.0, 721.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "domain": [ 20.0, 16000.0 ],
                                    "fontface": 0,
                                    "id": "obj-99",
                                    "maxclass": "filtergraph~",
                                    "nfilters": 1,
                                    "numinlets": 8,
                                    "numoutlets": 7,
                                    "outlettype": [ "list", "float", "float", "float", "float", "list", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 60.0, 773.0, 256.0, 128.0 ],
                                    "setfilter": [ 0, 5, 1, 0, 0, 1000.0, 1.0, 0.30000001192092896, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 ]
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-88",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 288.0, 384.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-83",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 924.6334925413132, 346.90064322948456, 122.0, 22.0 ],
                                    "text": "expr pow(10\\, $f1/20.)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-84",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 701.4145667552948, 610.0, 71.5, 22.0 ],
                                    "text": "biquad~"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-85",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 958.4906353984561, 384.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-86",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 890.7763496841703, 384.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "domain": [ 20.0, 16000.0 ],
                                    "fontface": 0,
                                    "id": "obj-87",
                                    "maxclass": "filtergraph~",
                                    "nfilters": 1,
                                    "numinlets": 8,
                                    "numoutlets": 7,
                                    "outlettype": [ "list", "float", "float", "float", "float", "list", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 721.4906353984561, 427.0515956878662, 256.0, 128.0 ],
                                    "setfilter": [ 0, 5, 1, 0, 0, 70.0, 1.0, 0.30000001192092896, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-82",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 254.14285714285714, 346.90064322948456, 122.0, 22.0 ],
                                    "text": "expr pow(10\\, $f1/20.)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-80",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 30.0, 610.0, 71.5, 22.0 ],
                                    "text": "biquad~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-77",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 220.28571428571428, 384.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "domain": [ 20.0, 16000.0 ],
                                    "fontface": 0,
                                    "id": "obj-75",
                                    "maxclass": "filtergraph~",
                                    "nfilters": 1,
                                    "numinlets": 8,
                                    "numoutlets": 7,
                                    "outlettype": [ "list", "float", "float", "float", "float", "list", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 51.0, 427.0515956878662, 256.0, 128.0 ],
                                    "setfilter": [ 0, 5, 1, 0, 0, 70.0, 1.0, 0.30000001192092896, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-56",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 210.0, 204.0, 31.0, 22.0 ],
                                    "text": "sig~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-55",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 210.0, 151.0, 123.0, 22.0 ],
                                    "text": "expr sin($f1 * 1.5708)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-53",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 66.0, 204.0, 31.0, 22.0 ],
                                    "text": "sig~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-52",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 66.0, 151.0, 127.0, 22.0 ],
                                    "text": "expr cos($f1 * 1.5708)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-51",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 30.0, 251.0, 55.0, 22.0 ],
                                    "text": "*~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-49",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 210.0, 100.0, 97.0, 22.0 ],
                                    "text": "expr ($f1 + 1) / 2"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-22",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 701.4145667552948, 1333.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-21",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 28.0, 1333.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-6",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 90.0, 100.0, 29.5, 22.0 ],
                                    "text": "*~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-5",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 30.0, 100.0, 29.5, 22.0 ],
                                    "text": "*~"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-4",
                                    "index": 7,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 360.0, 30.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-3",
                                    "index": 6,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 311.5, 30.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-2",
                                    "index": 5,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 259.0, 30.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-1",
                                    "index": 4,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 210.0, 30.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-25",
                                    "index": 3,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 154.0, 26.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-24",
                                    "index": 2,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 90.0, 30.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-23",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 30.0, 30.0, 25.0, 25.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-49", 0 ],
                                    "source": [ "obj-1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-109", 7 ],
                                    "source": [ "obj-100", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-105", 6 ],
                                    "source": [ "obj-101", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-22", 0 ],
                                    "source": [ "obj-102", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-105", 7 ],
                                    "source": [ "obj-103", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-105", 5 ],
                                    "source": [ "obj-104", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-102", 5 ],
                                    "order": 0,
                                    "source": [ "obj-105", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-102", 4 ],
                                    "order": 1,
                                    "source": [ "obj-105", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-102", 3 ],
                                    "order": 2,
                                    "source": [ "obj-105", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-102", 2 ],
                                    "order": 3,
                                    "source": [ "obj-105", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-102", 1 ],
                                    "order": 4,
                                    "source": [ "obj-105", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-109", 6 ],
                                    "source": [ "obj-106", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-21", 0 ],
                                    "source": [ "obj-107", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-109", 5 ],
                                    "source": [ "obj-108", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-107", 5 ],
                                    "order": 0,
                                    "source": [ "obj-109", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-107", 4 ],
                                    "order": 1,
                                    "source": [ "obj-109", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-107", 3 ],
                                    "order": 2,
                                    "source": [ "obj-109", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-107", 2 ],
                                    "order": 3,
                                    "source": [ "obj-109", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-107", 1 ],
                                    "order": 4,
                                    "source": [ "obj-109", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-82", 0 ],
                                    "order": 1,
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-83", 0 ],
                                    "order": 0,
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "source": [ "obj-23", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-6", 0 ],
                                    "source": [ "obj-24", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 1 ],
                                    "order": 1,
                                    "source": [ "obj-25", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-6", 1 ],
                                    "order": 0,
                                    "source": [ "obj-25", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-91", 0 ],
                                    "order": 0,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-96", 0 ],
                                    "order": 1,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-101", 0 ],
                                    "order": 0,
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-106", 0 ],
                                    "order": 1,
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-52", 0 ],
                                    "order": 1,
                                    "source": [ "obj-49", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-55", 0 ],
                                    "order": 0,
                                    "source": [ "obj-49", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-51", 0 ],
                                    "source": [ "obj-5", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-80", 0 ],
                                    "source": [ "obj-51", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-53", 0 ],
                                    "source": [ "obj-52", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-51", 1 ],
                                    "source": [ "obj-53", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-56", 0 ],
                                    "source": [ "obj-55", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-7", 1 ],
                                    "source": [ "obj-56", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-7", 0 ],
                                    "source": [ "obj-6", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-84", 0 ],
                                    "source": [ "obj-7", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-80", 5 ],
                                    "order": 0,
                                    "source": [ "obj-75", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-80", 4 ],
                                    "order": 1,
                                    "source": [ "obj-75", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-80", 3 ],
                                    "order": 2,
                                    "source": [ "obj-75", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-80", 2 ],
                                    "order": 3,
                                    "source": [ "obj-75", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-80", 1 ],
                                    "order": 4,
                                    "source": [ "obj-75", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-75", 5 ],
                                    "source": [ "obj-77", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-97", 0 ],
                                    "source": [ "obj-80", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-75", 6 ],
                                    "source": [ "obj-82", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-87", 6 ],
                                    "source": [ "obj-83", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-92", 0 ],
                                    "source": [ "obj-84", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-87", 7 ],
                                    "source": [ "obj-85", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-87", 5 ],
                                    "source": [ "obj-86", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-84", 5 ],
                                    "order": 0,
                                    "source": [ "obj-87", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-84", 4 ],
                                    "order": 1,
                                    "source": [ "obj-87", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-84", 3 ],
                                    "order": 2,
                                    "source": [ "obj-87", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-84", 2 ],
                                    "order": 3,
                                    "source": [ "obj-87", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-84", 1 ],
                                    "order": 4,
                                    "source": [ "obj-87", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-75", 7 ],
                                    "source": [ "obj-88", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-99", 7 ],
                                    "source": [ "obj-90", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-95", 6 ],
                                    "source": [ "obj-91", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-102", 0 ],
                                    "source": [ "obj-92", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-95", 7 ],
                                    "source": [ "obj-93", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-95", 5 ],
                                    "source": [ "obj-94", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-92", 5 ],
                                    "order": 0,
                                    "source": [ "obj-95", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-92", 4 ],
                                    "order": 1,
                                    "source": [ "obj-95", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-92", 3 ],
                                    "order": 2,
                                    "source": [ "obj-95", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-92", 2 ],
                                    "order": 3,
                                    "source": [ "obj-95", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-92", 1 ],
                                    "order": 4,
                                    "source": [ "obj-95", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-99", 6 ],
                                    "source": [ "obj-96", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-107", 0 ],
                                    "source": [ "obj-97", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-99", 5 ],
                                    "source": [ "obj-98", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-97", 5 ],
                                    "order": 0,
                                    "source": [ "obj-99", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-97", 4 ],
                                    "order": 1,
                                    "source": [ "obj-99", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-97", 3 ],
                                    "order": 2,
                                    "source": [ "obj-99", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-97", 2 ],
                                    "order": 3,
                                    "source": [ "obj-99", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-97", 1 ],
                                    "order": 4,
                                    "source": [ "obj-99", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 218.66666666666669, 297.0, 146.0, 22.0 ],
                    "text": "p processing"
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 41.66666666666666, 235.0, 55.0, 22.0 ],
                    "text": "adc~ 1 2"
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 41.935484170913696, 441.1290354132652, 45.0, 45.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "newobj",
                    "numinlets": 9,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 2,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "box",
                        "rect": [ 47.0, 147.0, 1000.0, 687.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-37",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 77.5, 238.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-36",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 15.0, 238.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-31",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 408.0, 80.0, 52.0, 22.0 ],
                                    "text": "Pitch $1"
                                }
                            },
                            {
                                "box": {
                                    "autosave": 1,
                                    "bgmode": 0,
                                    "border": 0,
                                    "clickthrough": 0,
                                    "id": "obj-32",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 8,
                                    "offset": [ 0.0, 0.0 ],
                                    "outlettype": [ "signal", "signal", "", "list", "int", "", "", "" ],
                                    "patching_rect": [ 408.0, 124.0, 92.5, 22.0 ],
                                    "save": [ "#N", "vst~", "loaduniqueid", 0, ";" ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_invisible": 1,
                                            "parameter_longname": "vst~[8]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "vst~[4]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "saved_object_attributes": {
                                        "parameter_enable": 1,
                                        "parameter_mappable": 0
                                    },
                                    "snapshot": {
                                        "filetype": "C74Snapshot",
                                        "version": 2,
                                        "minorversion": 0,
                                        "name": "snapshotlist",
                                        "origin": "vst~",
                                        "type": "list",
                                        "subtype": "Undefined",
                                        "embed": 1,
                                        "snapshot": {
                                            "pluginname": "kHs Pitch Shifter.vst3",
                                            "plugindisplayname": "kHs Pitch Shifter",
                                            "pluginsavedname": "",
                                            "pluginsaveduniqueid": 0,
                                            "version": 1,
                                            "isbank": 0,
                                            "isbase64": 1,
                                            "blob": "895.VMjLgX2....O+fWarAhckI2bo8la8HRLt.iHfTlai8FYo41Y8HRUTYTK3HxO9.BOVMEUy.Ea0cVZtMEcgQWY9vSRC8Vav8lak4Fc9TCN23RPt3hKtvjZt3hKtP0RM4RPT4hKBgjYt3hcLYyXhEjKt3hKt3hKt3hKt3hKt3hat3hKtXmX5UjQisFMnoUd3vVXyUGNV4TSNwDUX4xLsElUEgTbzDkdt4jaYolQ2YkK2YjKDoDdyHlVn8VNRoFN2QEcHEiMyrTSyUjaKc1JWglZOIyMsMFYwTmLyIEV3LjZQIFNEUmLyo0Z1gTV38FYyUGQLczTXciMDckURcyR4.CMZoVVMEGa0j1T0zjXKkma2sha5QjLOc1TvIVR2sFL1QSRrg2TWYyXqIUc0QTXUM2YSEFMXE0bzgGMXkEVpMCd5sBVIQDMp8jVtclTCIFRQcjRUslPOc0Q4UyPmolUkg2ck0jU50lPJAmS2okZ3jWQX4hQlEDVtXjYAgkKFYVPX4hQlEDVtXjYAgkKFYVPX4hQlEDVtXjYAgkKFYVPX4hQlEDVtXjYAgkKFYVPX4hQlEDVtXjYAgkKFYVPX4hQlEDVtXjYAgkKFYFMxgkRkUlarU0LRESXqfmMqsjLWICY0IzaYo2Q5ciZyQzUzLTPvcCb3XDbCY0MpwVVJIlXsQjU3rzZUsxayoESHACc43VNyYjckUWNqL2LComQYgmcsQSU2LFRSMULxwDTNQWYLMyT40lXj4zJqEEY4MlVgQVdvcmLH0zcqQzaHASX2XSMsMjZRcTdGg2MvE0bvUVaOIWUr01b1bzXXomR3UkMRMGNXQ2PWoDLss1L3UTUIoFROUCV17jUI8TStQSc2sTYVMiVKMWUN81bjY1U0rRVJQkYywjYy.0XgUWM0MGbxLyPVkTY30jMxkTSvMFLtD2JxT0RCcmTxIVVBgGQOQSbqnEcSQGNnEla1o1SqbjSVozb1jFcOEjKvH0QlA0XIgjRogiQt3hKxgkSt3hKTsTQl4hKt3RQtXlKBgjKtvTdjczUvrlYtwTLg4hKtXGZz3hKtnjKt3hKt3hKt3hKt3hKt3hKt3hKt3hKtjWTWgkdUw1Rv0jLgQWPvHUQX4hKt3hKtDjKP4hKlMjKt3BT3DjKt3hKt3BOujzPu0Fbu4VYtQmO77hUSQ0LPwVcmklaSQWXzUlO.."
                                        },
                                        "snapshotlist": {
                                            "current_snapshot": 0,
                                            "entries": [
                                                {
                                                    "filetype": "C74Snapshot",
                                                    "version": 2,
                                                    "minorversion": 0,
                                                    "name": "kHs Pitch Shifter",
                                                    "origin": "kHs Pitch Shifter.vst3",
                                                    "type": "VST3",
                                                    "subtype": "MidiEffect",
                                                    "embed": 0,
                                                    "snapshot": {
                                                        "pluginname": "kHs Pitch Shifter.vst3",
                                                        "plugindisplayname": "kHs Pitch Shifter",
                                                        "pluginsavedname": "",
                                                        "pluginsaveduniqueid": 0,
                                                        "version": 1,
                                                        "isbank": 0,
                                                        "isbase64": 1,
                                                        "blob": "895.VMjLgX2....O+fWarAhckI2bo8la8HRLt.iHfTlai8FYo41Y8HRUTYTK3HxO9.BOVMEUy.Ea0cVZtMEcgQWY9vSRC8Vav8lak4Fc9TCN23RPt3hKtvjZt3hKtP0RM4RPT4hKBgjYt3hcLYyXhEjKt3hKt3hKt3hKt3hKt3hat3hKtXmX5UjQisFMnoUd3vVXyUGNV4TSNwDUX4xLsElUEgTbzDkdt4jaYolQ2YkK2YjKDoDdyHlVn8VNRoFN2QEcHEiMyrTSyUjaKc1JWglZOIyMsMFYwTmLyIEV3LjZQIFNEUmLyo0Z1gTV38FYyUGQLczTXciMDckURcyR4.CMZoVVMEGa0j1T0zjXKkma2sha5QjLOc1TvIVR2sFL1QSRrg2TWYyXqIUc0QTXUM2YSEFMXE0bzgGMXkEVpMCd5sBVIQDMp8jVtclTCIFRQcjRUslPOc0Q4UyPmolUkg2ck0jU50lPJAmS2okZ3jWQX4hQlEDVtXjYAgkKFYVPX4hQlEDVtXjYAgkKFYVPX4hQlEDVtXjYAgkKFYVPX4hQlEDVtXjYAgkKFYVPX4hQlEDVtXjYAgkKFYVPX4hQlEDVtXjYAgkKFYFMxgkRkUlarU0LRESXqfmMqsjLWICY0IzaYo2Q5ciZyQzUzLTPvcCb3XDbCY0MpwVVJIlXsQjU3rzZUsxayoESHACc43VNyYjckUWNqL2LComQYgmcsQSU2LFRSMULxwDTNQWYLMyT40lXj4zJqEEY4MlVgQVdvcmLH0zcqQzaHASX2XSMsMjZRcTdGg2MvE0bvUVaOIWUr01b1bzXXomR3UkMRMGNXQ2PWoDLss1L3UTUIoFROUCV17jUI8TStQSc2sTYVMiVKMWUN81bjY1U0rRVJQkYywjYy.0XgUWM0MGbxLyPVkTY30jMxkTSvMFLtD2JxT0RCcmTxIVVBgGQOQSbqnEcSQGNnEla1o1SqbjSVozb1jFcOEjKvH0QlA0XIgjRogiQt3hKxgkSt3hKTsTQl4hKt3RQtXlKBgjKtvTdjczUvrlYtwTLg4hKtXGZz3hKtnjKt3hKt3hKt3hKt3hKt3hKt3hKt3hKtjWTWgkdUw1Rv0jLgQWPvHUQX4hKt3hKtDjKP4hKlMjKt3BT3DjKt3hKt3BOujzPu0Fbu4VYtQmO77hUSQ0LPwVcmklaSQWXzUlO.."
                                                    },
                                                    "fileref": {
                                                        "name": "kHs Pitch Shifter",
                                                        "filename": "kHs Pitch Shifter.maxsnap",
                                                        "filepath": "~/Documents/Max 9/Snapshots",
                                                        "filepos": -1,
                                                        "snapshotfileid": "ab1cd25b3bce77dec514f011101409b4"
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "text": "vst~",
                                    "varname": "vst~[2]",
                                    "viewvisibility": 0
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-33",
                                    "index": 9,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 528.0, 15.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-34",
                                    "index": 8,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 482.0, 15.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-35",
                                    "index": 7,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 408.0, 15.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-26",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 207.0, 80.0, 52.0, 22.0 ],
                                    "text": "Pitch $1"
                                }
                            },
                            {
                                "box": {
                                    "autosave": 1,
                                    "bgmode": 0,
                                    "border": 0,
                                    "clickthrough": 0,
                                    "id": "obj-27",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 8,
                                    "offset": [ 0.0, 0.0 ],
                                    "outlettype": [ "signal", "signal", "", "list", "int", "", "", "" ],
                                    "patching_rect": [ 207.0, 124.0, 92.5, 22.0 ],
                                    "save": [ "#N", "vst~", "loaduniqueid", 0, ";" ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_invisible": 1,
                                            "parameter_longname": "vst~[7]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "vst~[4]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "saved_object_attributes": {
                                        "parameter_enable": 1,
                                        "parameter_mappable": 0
                                    },
                                    "snapshot": {
                                        "filetype": "C74Snapshot",
                                        "version": 2,
                                        "minorversion": 0,
                                        "name": "snapshotlist",
                                        "origin": "vst~",
                                        "type": "list",
                                        "subtype": "Undefined",
                                        "embed": 1,
                                        "snapshot": {
                                            "pluginname": "kHs Pitch Shifter.vst3",
                                            "plugindisplayname": "kHs Pitch Shifter",
                                            "pluginsavedname": "",
                                            "pluginsaveduniqueid": 0,
                                            "version": 1,
                                            "isbank": 0,
                                            "isbase64": 1,
                                            "blob": "895.VMjLgX2....O+fWarAhckI2bo8la8HRLt.iHfTlai8FYo41Y8HRUTYTK3HxO9.BOVMEUy.Ea0cVZtMEcgQWY9vSRC8Vav8lak4Fc9TCN23RPt3hKtvjZt3hKtP0RM4RPT4hKBgjYt3hcLYyXhEjKt3hKt3hKt3hKt3hKt3hat3hKtXmX5UjQisFMnoUd3vVXyUGNV4TSNwDUX4xLsElUEgTbzDkdt4jaYolQ2YkK2YjKDoDdyHlVn8VNRoFN2QEcHEiMyrTSyUjaKc1JWglZOIyMsMFYwTmLyIEV3LjZQIFNEUmLyo0Z1gTV38FYyUGQLczTXciMDckURcyR4.CMZoVVMEGa0j1T0zjXKkma2sha5QjLOc1TvIVR2sFL1QSRrg2TWYyXqIUc0QTXUM2YSEFMXE0bzgGMXkEVpMCd5sBVIQDMp8jVtclTCIFRQcjRUslPOc0Q4UyPmolUkg2ck0jU50lPJAmS2okZ3jWQX4hQlEDVtXjYAgkKFYVPX4hQlEDVtXjYAgkKFYVPX4hQlEDVtXjYAgkKFYVPX4hQlEDVtXjYAgkKFYVPX4hQlEDVtXjYAgkKFYVPX4hQlEDVtXjYAgkKFYFMxgkRkUlarU0LRESXqfmMqsjLWICY0IzaYo2Q5ciZyQzUzLTPvcCb3XDbCY0MpwVVJIlXsQjU3rzZUsxayoESHACc43VNyYjckUWNqL2LComQYgmcsQSU2LFRSMULxwDTNQWYLMyT40lXj4zJqEEY4MlVgQVdvcmLH0zcqQzaHASX2XSMsMjZRcTdGg2MvE0bvUVaOIWUr01b1bzXXomR3UkMRMGNXQ2PWoDLss1L3UTUIoFROUCV17jUI8TStQSc2sTYVMiVKMWUN81bjY1U0rRVJQkYywjYy.0XgUWM0MGbxLyPVkTY30jMxkTSvMFLtD2JxT0RCcmTxIVVBgGQOQSbqnEcSQGNnEla1o1SqbjSVozb1jFcOEjKvH0QlA0XIgjRogiQt3hKxgkSt3hKTsTQl4hKt3RQtXlKBgjKtvTdjczUvrlYtwTLg4hKtXGZz3hKtnjKt3hKt3hKt3hKt3hKt3hKt3hKt3hKtjWTWgkdUw1Rv0jLgQWPvHUQX4hKt3hKtDjKP4hKlMjKt3BT3DjKt3hKt3BOujzPu0Fbu4VYtQmO77hUSQ0LPwVcmklaSQWXzUlO.."
                                        },
                                        "snapshotlist": {
                                            "current_snapshot": 0,
                                            "entries": [
                                                {
                                                    "filetype": "C74Snapshot",
                                                    "version": 2,
                                                    "minorversion": 0,
                                                    "name": "kHs Pitch Shifter",
                                                    "origin": "kHs Pitch Shifter.vst3",
                                                    "type": "VST3",
                                                    "subtype": "MidiEffect",
                                                    "embed": 0,
                                                    "snapshot": {
                                                        "pluginname": "kHs Pitch Shifter.vst3",
                                                        "plugindisplayname": "kHs Pitch Shifter",
                                                        "pluginsavedname": "",
                                                        "pluginsaveduniqueid": 0,
                                                        "version": 1,
                                                        "isbank": 0,
                                                        "isbase64": 1,
                                                        "blob": "895.VMjLgX2....O+fWarAhckI2bo8la8HRLt.iHfTlai8FYo41Y8HRUTYTK3HxO9.BOVMEUy.Ea0cVZtMEcgQWY9vSRC8Vav8lak4Fc9TCN23RPt3hKtvjZt3hKtP0RM4RPT4hKBgjYt3hcLYyXhEjKt3hKt3hKt3hKt3hKt3hat3hKtXmX5UjQisFMnoUd3vVXyUGNV4TSNwDUX4xLsElUEgTbzDkdt4jaYolQ2YkK2YjKDoDdyHlVn8VNRoFN2QEcHEiMyrTSyUjaKc1JWglZOIyMsMFYwTmLyIEV3LjZQIFNEUmLyo0Z1gTV38FYyUGQLczTXciMDckURcyR4.CMZoVVMEGa0j1T0zjXKkma2sha5QjLOc1TvIVR2sFL1QSRrg2TWYyXqIUc0QTXUM2YSEFMXE0bzgGMXkEVpMCd5sBVIQDMp8jVtclTCIFRQcjRUslPOc0Q4UyPmolUkg2ck0jU50lPJAmS2okZ3jWQX4hQlEDVtXjYAgkKFYVPX4hQlEDVtXjYAgkKFYVPX4hQlEDVtXjYAgkKFYVPX4hQlEDVtXjYAgkKFYVPX4hQlEDVtXjYAgkKFYVPX4hQlEDVtXjYAgkKFYFMxgkRkUlarU0LRESXqfmMqsjLWICY0IzaYo2Q5ciZyQzUzLTPvcCb3XDbCY0MpwVVJIlXsQjU3rzZUsxayoESHACc43VNyYjckUWNqL2LComQYgmcsQSU2LFRSMULxwDTNQWYLMyT40lXj4zJqEEY4MlVgQVdvcmLH0zcqQzaHASX2XSMsMjZRcTdGg2MvE0bvUVaOIWUr01b1bzXXomR3UkMRMGNXQ2PWoDLss1L3UTUIoFROUCV17jUI8TStQSc2sTYVMiVKMWUN81bjY1U0rRVJQkYywjYy.0XgUWM0MGbxLyPVkTY30jMxkTSvMFLtD2JxT0RCcmTxIVVBgGQOQSbqnEcSQGNnEla1o1SqbjSVozb1jFcOEjKvH0QlA0XIgjRogiQt3hKxgkSt3hKTsTQl4hKt3RQtXlKBgjKtvTdjczUvrlYtwTLg4hKtXGZz3hKtnjKt3hKt3hKt3hKt3hKt3hKt3hKt3hKtjWTWgkdUw1Rv0jLgQWPvHUQX4hKt3hKtDjKP4hKlMjKt3BT3DjKt3hKt3BOujzPu0Fbu4VYtQmO77hUSQ0LPwVcmklaSQWXzUlO.."
                                                    },
                                                    "fileref": {
                                                        "name": "kHs Pitch Shifter",
                                                        "filename": "kHs Pitch Shifter_20260323.maxsnap",
                                                        "filepath": "~/Documents/Max 9/Snapshots",
                                                        "filepos": -1,
                                                        "snapshotfileid": "72f98b817a93458eb266def8852b6c8c"
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "text": "vst~",
                                    "varname": "vst~[1]",
                                    "viewvisibility": 0
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-28",
                                    "index": 6,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 327.0, 15.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-29",
                                    "index": 5,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 281.0, 15.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-30",
                                    "index": 4,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 207.0, 15.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-18",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 15.0, 80.0, 52.0, 22.0 ],
                                    "text": "Pitch $1"
                                }
                            },
                            {
                                "box": {
                                    "autosave": 1,
                                    "bgmode": 0,
                                    "border": 0,
                                    "clickthrough": 0,
                                    "id": "obj-11",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 8,
                                    "offset": [ 0.0, 0.0 ],
                                    "outlettype": [ "signal", "signal", "", "list", "int", "", "", "" ],
                                    "patching_rect": [ 15.0, 124.0, 92.5, 22.0 ],
                                    "save": [ "#N", "vst~", "loaduniqueid", 0, ";" ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_invisible": 1,
                                            "parameter_longname": "vst~[4]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "vst~[4]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "saved_object_attributes": {
                                        "parameter_enable": 1,
                                        "parameter_mappable": 0
                                    },
                                    "snapshot": {
                                        "filetype": "C74Snapshot",
                                        "version": 2,
                                        "minorversion": 0,
                                        "name": "snapshotlist",
                                        "origin": "vst~",
                                        "type": "list",
                                        "subtype": "Undefined",
                                        "embed": 1,
                                        "snapshot": {
                                            "pluginname": "kHs Pitch Shifter.vst3",
                                            "plugindisplayname": "kHs Pitch Shifter",
                                            "pluginsavedname": "",
                                            "pluginsaveduniqueid": 0,
                                            "version": 1,
                                            "isbank": 0,
                                            "isbase64": 1,
                                            "blob": "895.VMjLgX2....O+fWarAhckI2bo8la8HRLt.iHfTlai8FYo41Y8HRUTYTK3HxO9.BOVMEUy.Ea0cVZtMEcgQWY9vSRC8Vav8lak4Fc9TCN23RPt3hKtvjZt3hKtP0RM4RPT4hKBgjYt3hcLYyXhEjKt3hKt3hKt3hKt3hKt3hat3hKtXmX5UjQisFMnoUd3vVXyUGNV4TSNwDUX4xLsElUEgTbzDkdt4jaYolQ2YkK2YjKDoDdyHlVn8VNRoFN2QEcHEiMyrTSyUjaKc1JWglZOIyMsMFYwTmLyIEV3LjZQIFNEUmLyo0Z1gTV38FYyUGQLczTXciMDckURcyR4.CMZoVVMEGa0j1T0zjXKkma2sha5QjLOc1TvIVR2sFL1QSRrg2TWYyXqIUc0QTXUM2YSEFMXE0bzgGMXkEVpMCd5sBVIQDMp8jVtclTCIFRQcjRUslPOc0Q4UyPmolUkg2ck0jU50lPJAmS2okZ3jWQX4hQlEDVtXjYAgkKFYVPX4hQlEDVtXjYAgkKFYVPX4hQlEDVtXjYAgkKFYVPX4hQlEDVtXjYAgkKFYVPX4hQlEDVtXjYAgkKFYVPX4hQlEDVtXjYAgkKFYFMxgkRkUlarU0LRESXqfmMqsjLWICY0IzaYo2Q5ciZyQzUzLTPvcCb3XDbCY0MpwVVJIlXsQjU3rzZUsxayoESHACc43VNyYjckUWNqL2LComQYgmcsQSU2LFRSMULxwDTNQWYLMyT40lXj4zJqEEY4MlVgQVdvcmLH0zcqQzaHASX2XSMsMjZRcTdGg2MvE0bvUVaOIWUr01b1bzXXomR3UkMRMGNXQ2PWoDLss1L3UTUIoFROUCV17jUI8TStQSc2sTYVMiVKMWUN81bjY1U0rRVJQkYywjYy.0XgUWM0MGbxLyPVkTY30jMxkTSvMFLtD2JxT0RCcmTxIVVBgGQOQSbqnEcSQGNnEla1o1SqbjSVozb1jFcOEjKvH0QlA0XIgjRogiQt3hKxgkSt3hKTsTQl4hKt3RQtXlKBgjKtvTdjczUvrlYtwTLg4hKtXGZz3hKtnjKt3hKt3hKt3hKt3hKt3hKt3hKt3hKtjWTWgkdUw1Rv0jLgQWPvHUQX4hKt3hKtDjKP4hKlMjKt3BT3DjKt3hKt3BOujzPu0Fbu4VYtQmO77hUSQ0LPwVcmklaSQWXzUlO.."
                                        },
                                        "snapshotlist": {
                                            "current_snapshot": 0,
                                            "entries": [
                                                {
                                                    "filetype": "C74Snapshot",
                                                    "version": 2,
                                                    "minorversion": 0,
                                                    "name": "kHs Pitch Shifter",
                                                    "origin": "kHs Pitch Shifter.vst3",
                                                    "type": "VST3",
                                                    "subtype": "MidiEffect",
                                                    "embed": 0,
                                                    "snapshot": {
                                                        "pluginname": "kHs Pitch Shifter.vst3",
                                                        "plugindisplayname": "kHs Pitch Shifter",
                                                        "pluginsavedname": "",
                                                        "pluginsaveduniqueid": 0,
                                                        "version": 1,
                                                        "isbank": 0,
                                                        "isbase64": 1,
                                                        "blob": "895.VMjLgX2....O+fWarAhckI2bo8la8HRLt.iHfTlai8FYo41Y8HRUTYTK3HxO9.BOVMEUy.Ea0cVZtMEcgQWY9vSRC8Vav8lak4Fc9TCN23RPt3hKtvjZt3hKtP0RM4RPT4hKBgjYt3hcLYyXhEjKt3hKt3hKt3hKt3hKt3hat3hKtXmX5UjQisFMnoUd3vVXyUGNV4TSNwDUX4xLsElUEgTbzDkdt4jaYolQ2YkK2YjKDoDdyHlVn8VNRoFN2QEcHEiMyrTSyUjaKc1JWglZOIyMsMFYwTmLyIEV3LjZQIFNEUmLyo0Z1gTV38FYyUGQLczTXciMDckURcyR4.CMZoVVMEGa0j1T0zjXKkma2sha5QjLOc1TvIVR2sFL1QSRrg2TWYyXqIUc0QTXUM2YSEFMXE0bzgGMXkEVpMCd5sBVIQDMp8jVtclTCIFRQcjRUslPOc0Q4UyPmolUkg2ck0jU50lPJAmS2okZ3jWQX4hQlEDVtXjYAgkKFYVPX4hQlEDVtXjYAgkKFYVPX4hQlEDVtXjYAgkKFYVPX4hQlEDVtXjYAgkKFYVPX4hQlEDVtXjYAgkKFYVPX4hQlEDVtXjYAgkKFYFMxgkRkUlarU0LRESXqfmMqsjLWICY0IzaYo2Q5ciZyQzUzLTPvcCb3XDbCY0MpwVVJIlXsQjU3rzZUsxayoESHACc43VNyYjckUWNqL2LComQYgmcsQSU2LFRSMULxwDTNQWYLMyT40lXj4zJqEEY4MlVgQVdvcmLH0zcqQzaHASX2XSMsMjZRcTdGg2MvE0bvUVaOIWUr01b1bzXXomR3UkMRMGNXQ2PWoDLss1L3UTUIoFROUCV17jUI8TStQSc2sTYVMiVKMWUN81bjY1U0rRVJQkYywjYy.0XgUWM0MGbxLyPVkTY30jMxkTSvMFLtD2JxT0RCcmTxIVVBgGQOQSbqnEcSQGNnEla1o1SqbjSVozb1jFcOEjKvH0QlA0XIgjRogiQt3hKxgkSt3hKTsTQl4hKt3RQtXlKBgjKtvTdjczUvrlYtwTLg4hKtXGZz3hKtnjKt3hKt3hKt3hKt3hKt3hKt3hKt3hKtjWTWgkdUw1Rv0jLgQWPvHUQX4hKt3hKtDjKP4hKlMjKt3BT3DjKt3hKt3BOujzPu0Fbu4VYtQmO77hUSQ0LPwVcmklaSQWXzUlO.."
                                                    },
                                                    "fileref": {
                                                        "name": "kHs Pitch Shifter",
                                                        "filename": "kHs Pitch Shifter_20260323_1.maxsnap",
                                                        "filepath": "~/Documents/Max 9/Snapshots",
                                                        "filepos": -1,
                                                        "snapshotfileid": "d6f3a72a507dd55d44e1659bcc287cec"
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "text": "vst~",
                                    "varname": "vst~[3]",
                                    "viewvisibility": 0
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-25",
                                    "index": 3,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 135.0, 15.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-24",
                                    "index": 2,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 88.5, 15.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-23",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 15.0, 15.0, 25.0, 25.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-36", 0 ],
                                    "source": [ "obj-11", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-37", 0 ],
                                    "source": [ "obj-11", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 0 ],
                                    "source": [ "obj-18", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 0 ],
                                    "source": [ "obj-23", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 1 ],
                                    "source": [ "obj-24", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-18", 0 ],
                                    "source": [ "obj-25", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-27", 0 ],
                                    "source": [ "obj-26", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-36", 0 ],
                                    "source": [ "obj-27", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-37", 0 ],
                                    "source": [ "obj-27", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-26", 0 ],
                                    "source": [ "obj-28", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-27", 1 ],
                                    "source": [ "obj-29", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-27", 0 ],
                                    "source": [ "obj-30", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-32", 0 ],
                                    "source": [ "obj-31", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-36", 0 ],
                                    "source": [ "obj-32", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-37", 0 ],
                                    "source": [ "obj-32", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-31", 0 ],
                                    "source": [ "obj-33", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-32", 1 ],
                                    "source": [ "obj-34", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-32", 0 ],
                                    "source": [ "obj-35", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 41.935484170913696, 351.6129057407379, 500.73118249575305, 22.0 ],
                    "text": "p shifting"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 7,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 2,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "box",
                        "rect": [ 271.0, 108.0, 1000.0, 687.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-7",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 75.0, 236.0, 55.0, 22.0 ],
                                    "text": "*~"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-100",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 271.0, 1031.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-101",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 921.5574238981519, 994.0, 122.0, 22.0 ],
                                    "text": "expr pow(10\\, $f1/20.)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-102",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 686.4145667552948, 1256.0, 71.5, 22.0 ],
                                    "text": "biquad~"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-103",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 955.4145667552948, 1031.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-104",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 887.700281041009, 1031.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "domain": [ 20.0, 16000.0 ],
                                    "fontface": 0,
                                    "id": "obj-105",
                                    "maxclass": "filtergraph~",
                                    "nfilters": 1,
                                    "numinlets": 8,
                                    "numoutlets": 7,
                                    "outlettype": [ "list", "float", "float", "float", "float", "list", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 718.4145667552948, 1086.0, 256.0, 128.0 ],
                                    "setfilter": [ 0, 5, 1, 0, 0, 5000.0, 1.0, 0.30000001192092896, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-106",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 237.0, 994.0, 122.0, 22.0 ],
                                    "text": "expr pow(10\\, $f1/20.)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-107",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 13.0, 1256.0, 71.5, 22.0 ],
                                    "text": "biquad~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-108",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 204.0, 1031.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "domain": [ 20.0, 16000.0 ],
                                    "fontface": 0,
                                    "id": "obj-109",
                                    "maxclass": "filtergraph~",
                                    "nfilters": 1,
                                    "numinlets": 8,
                                    "numoutlets": 7,
                                    "outlettype": [ "list", "float", "float", "float", "float", "list", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 34.0, 1086.0, 256.0, 128.0 ],
                                    "setfilter": [ 0, 5, 1, 0, 0, 5000.0, 1.0, 0.30000001192092896, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 ]
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-90",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 282.0, 706.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-91",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 909.6334925413132, 667.0, 122.0, 22.0 ],
                                    "text": "expr pow(10\\, $f1/20.)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-92",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 686.4145667552948, 941.0, 71.5, 22.0 ],
                                    "text": "biquad~"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-93",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 943.4906353984561, 706.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-94",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 876.0, 706.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "domain": [ 20.0, 16000.0 ],
                                    "fontface": 0,
                                    "id": "obj-95",
                                    "maxclass": "filtergraph~",
                                    "nfilters": 1,
                                    "numinlets": 8,
                                    "numoutlets": 7,
                                    "outlettype": [ "list", "float", "float", "float", "float", "list", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 706.4906353984561, 758.0, 256.0, 128.0 ],
                                    "setfilter": [ 0, 5, 1, 0, 0, 1000.0, 1.0, 0.30000001192092896, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-96",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 248.0, 667.0, 122.0, 22.0 ],
                                    "text": "expr pow(10\\, $f1/20.)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-97",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 13.0, 941.0, 71.5, 22.0 ],
                                    "text": "biquad~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-98",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 214.0, 706.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "domain": [ 20.0, 16000.0 ],
                                    "fontface": 0,
                                    "id": "obj-99",
                                    "maxclass": "filtergraph~",
                                    "nfilters": 1,
                                    "numinlets": 8,
                                    "numoutlets": 7,
                                    "outlettype": [ "list", "float", "float", "float", "float", "list", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 45.0, 758.0, 256.0, 128.0 ],
                                    "setfilter": [ 0, 5, 1, 0, 0, 1000.0, 1.0, 0.30000001192092896, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 ]
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-88",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 273.0, 369.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-83",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 909.6334925413132, 331.90064322948456, 122.0, 22.0 ],
                                    "text": "expr pow(10\\, $f1/20.)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-84",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 686.4145667552948, 595.0, 71.5, 22.0 ],
                                    "text": "biquad~"
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-85",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 943.4906353984561, 369.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-86",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 875.7763496841703, 369.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "domain": [ 20.0, 16000.0 ],
                                    "fontface": 0,
                                    "id": "obj-87",
                                    "maxclass": "filtergraph~",
                                    "nfilters": 1,
                                    "numinlets": 8,
                                    "numoutlets": 7,
                                    "outlettype": [ "list", "float", "float", "float", "float", "list", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 706.4906353984561, 412.0515956878662, 256.0, 128.0 ],
                                    "setfilter": [ 0, 5, 1, 0, 0, 70.0, 1.0, 0.30000001192092896, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-82",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 239.14285714285714, 331.90064322948456, 122.0, 22.0 ],
                                    "text": "expr pow(10\\, $f1/20.)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-80",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 15.0, 595.0, 71.5, 22.0 ],
                                    "text": "biquad~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-77",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 205.28571428571428, 369.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "domain": [ 20.0, 16000.0 ],
                                    "fontface": 0,
                                    "id": "obj-75",
                                    "maxclass": "filtergraph~",
                                    "nfilters": 1,
                                    "numinlets": 8,
                                    "numoutlets": 7,
                                    "outlettype": [ "list", "float", "float", "float", "float", "list", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 36.0, 412.0515956878662, 256.0, 128.0 ],
                                    "setfilter": [ 0, 5, 1, 0, 0, 70.0, 1.0, 0.30000001192092896, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-56",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 195.0, 189.0, 31.0, 22.0 ],
                                    "text": "sig~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-55",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 195.0, 136.0, 123.0, 22.0 ],
                                    "text": "expr sin($f1 * 1.5708)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-53",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 51.0, 189.0, 31.0, 22.0 ],
                                    "text": "sig~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-52",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 51.0, 136.0, 127.0, 22.0 ],
                                    "text": "expr cos($f1 * 1.5708)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-51",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 15.0, 236.0, 55.0, 22.0 ],
                                    "text": "*~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-49",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 195.0, 85.0, 97.0, 22.0 ],
                                    "text": "expr ($f1 + 1) / 2"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-22",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 686.4145667552948, 1318.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-21",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 13.0, 1318.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-6",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 75.0, 85.0, 29.5, 22.0 ],
                                    "text": "*~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-5",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 15.0, 85.0, 29.5, 22.0 ],
                                    "text": "*~"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-4",
                                    "index": 7,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 345.0, 15.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-3",
                                    "index": 6,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 296.5, 15.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-2",
                                    "index": 5,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 244.0, 15.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-1",
                                    "index": 4,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 195.0, 15.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-25",
                                    "index": 3,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 139.0, 11.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-24",
                                    "index": 2,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 75.0, 15.0, 25.0, 25.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-23",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 15.0, 15.0, 25.0, 25.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-49", 0 ],
                                    "source": [ "obj-1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-109", 7 ],
                                    "source": [ "obj-100", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-105", 6 ],
                                    "source": [ "obj-101", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-22", 0 ],
                                    "source": [ "obj-102", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-105", 7 ],
                                    "source": [ "obj-103", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-105", 5 ],
                                    "source": [ "obj-104", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-102", 5 ],
                                    "order": 0,
                                    "source": [ "obj-105", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-102", 4 ],
                                    "order": 1,
                                    "source": [ "obj-105", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-102", 3 ],
                                    "order": 2,
                                    "source": [ "obj-105", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-102", 2 ],
                                    "order": 3,
                                    "source": [ "obj-105", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-102", 1 ],
                                    "order": 4,
                                    "source": [ "obj-105", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-109", 6 ],
                                    "source": [ "obj-106", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-21", 0 ],
                                    "source": [ "obj-107", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-109", 5 ],
                                    "source": [ "obj-108", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-107", 5 ],
                                    "order": 0,
                                    "source": [ "obj-109", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-107", 4 ],
                                    "order": 1,
                                    "source": [ "obj-109", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-107", 3 ],
                                    "order": 2,
                                    "source": [ "obj-109", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-107", 2 ],
                                    "order": 3,
                                    "source": [ "obj-109", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-107", 1 ],
                                    "order": 4,
                                    "source": [ "obj-109", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-82", 0 ],
                                    "order": 1,
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-83", 0 ],
                                    "order": 0,
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "source": [ "obj-23", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-6", 0 ],
                                    "source": [ "obj-24", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 1 ],
                                    "order": 1,
                                    "source": [ "obj-25", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-6", 1 ],
                                    "order": 0,
                                    "source": [ "obj-25", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-91", 0 ],
                                    "order": 0,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-96", 0 ],
                                    "order": 1,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-101", 0 ],
                                    "order": 0,
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-106", 0 ],
                                    "order": 1,
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-52", 0 ],
                                    "order": 1,
                                    "source": [ "obj-49", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-55", 0 ],
                                    "order": 0,
                                    "source": [ "obj-49", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-51", 0 ],
                                    "source": [ "obj-5", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-80", 0 ],
                                    "source": [ "obj-51", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-53", 0 ],
                                    "source": [ "obj-52", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-51", 1 ],
                                    "source": [ "obj-53", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-56", 0 ],
                                    "source": [ "obj-55", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-7", 1 ],
                                    "source": [ "obj-56", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-7", 0 ],
                                    "source": [ "obj-6", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-84", 0 ],
                                    "source": [ "obj-7", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-80", 5 ],
                                    "order": 0,
                                    "source": [ "obj-75", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-80", 4 ],
                                    "order": 1,
                                    "source": [ "obj-75", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-80", 3 ],
                                    "order": 2,
                                    "source": [ "obj-75", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-80", 2 ],
                                    "order": 3,
                                    "source": [ "obj-75", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-80", 1 ],
                                    "order": 4,
                                    "source": [ "obj-75", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-75", 5 ],
                                    "source": [ "obj-77", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-97", 0 ],
                                    "source": [ "obj-80", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-75", 6 ],
                                    "source": [ "obj-82", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-87", 6 ],
                                    "source": [ "obj-83", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-92", 0 ],
                                    "source": [ "obj-84", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-87", 7 ],
                                    "source": [ "obj-85", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-87", 5 ],
                                    "source": [ "obj-86", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-84", 5 ],
                                    "order": 0,
                                    "source": [ "obj-87", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-84", 4 ],
                                    "order": 1,
                                    "source": [ "obj-87", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-84", 3 ],
                                    "order": 2,
                                    "source": [ "obj-87", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-84", 2 ],
                                    "order": 3,
                                    "source": [ "obj-87", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-84", 1 ],
                                    "order": 4,
                                    "source": [ "obj-87", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-75", 7 ],
                                    "source": [ "obj-88", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-99", 7 ],
                                    "source": [ "obj-90", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-95", 6 ],
                                    "source": [ "obj-91", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-102", 0 ],
                                    "source": [ "obj-92", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-95", 7 ],
                                    "source": [ "obj-93", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-95", 5 ],
                                    "source": [ "obj-94", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-92", 5 ],
                                    "order": 0,
                                    "source": [ "obj-95", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-92", 4 ],
                                    "order": 1,
                                    "source": [ "obj-95", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-92", 3 ],
                                    "order": 2,
                                    "source": [ "obj-95", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-92", 2 ],
                                    "order": 3,
                                    "source": [ "obj-95", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-92", 1 ],
                                    "order": 4,
                                    "source": [ "obj-95", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-99", 6 ],
                                    "source": [ "obj-96", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-107", 0 ],
                                    "source": [ "obj-97", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-99", 5 ],
                                    "source": [ "obj-98", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-97", 5 ],
                                    "order": 0,
                                    "source": [ "obj-99", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-97", 4 ],
                                    "order": 1,
                                    "source": [ "obj-99", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-97", 3 ],
                                    "order": 2,
                                    "source": [ "obj-99", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-97", 2 ],
                                    "order": 3,
                                    "source": [ "obj-99", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-97", 1 ],
                                    "order": 4,
                                    "source": [ "obj-99", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 41.66666666666666, 297.0, 146.0, 22.0 ],
                    "text": "p processing"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 403.0, 162.0, 146.0, 22.0 ],
                    "text": "OSC-route /low /mid /high"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 225.0, 162.0, 146.0, 22.0 ],
                    "text": "OSC-route /low /mid /high"
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 48.0, 162.0, 146.0, 22.0 ],
                    "text": "OSC-route /low /mid /high"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "", "", "", "", "" ],
                    "patching_rect": [ 403.0, 118.0, 163.0, 22.0 ],
                    "text": "OSC-route /eq /vol /pan /shift"
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "", "", "", "", "" ],
                    "patching_rect": [ 225.0, 118.0, 163.0, 22.0 ],
                    "text": "OSC-route /eq /vol /pan /shift"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "", "", "", "", "" ],
                    "patching_rect": [ 48.0, 118.0, 163.0, 22.0 ],
                    "text": "OSC-route /eq /vol /pan /shift"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 48.0, 58.0, 130.0, 22.0 ],
                    "text": "OSC-route /dx /mx /sfx"
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 48.0, 16.0, 97.0, 22.0 ],
                    "text": "udpreceive 8000"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 1 ],
                    "source": [ "obj-10", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 0 ],
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 3 ],
                    "source": [ "obj-11", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 2 ],
                    "source": [ "obj-11", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 2 ],
                    "source": [ "obj-11", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 1 ],
                    "source": [ "obj-12", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 4 ],
                    "source": [ "obj-13", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 3 ],
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 1 ],
                    "source": [ "obj-14", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 7 ],
                    "source": [ "obj-15", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 6 ],
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 6 ],
                    "source": [ "obj-16", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 5 ],
                    "source": [ "obj-16", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 4 ],
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-2", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-2", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 3 ],
                    "source": [ "obj-3", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 2 ],
                    "source": [ "obj-3", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 5 ],
                    "source": [ "obj-3", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 3 ],
                    "source": [ "obj-4", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 2 ],
                    "source": [ "obj-4", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 8 ],
                    "source": [ "obj-4", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 6 ],
                    "source": [ "obj-5", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 5 ],
                    "source": [ "obj-5", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 4 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 6 ],
                    "source": [ "obj-6", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 5 ],
                    "source": [ "obj-6", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 4 ],
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 1 ],
                    "source": [ "obj-7", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 1 ],
                    "source": [ "obj-8", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "source": [ "obj-8", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-8::obj-11": [ "vst~[4]", "vst~[4]", 0 ],
            "obj-8::obj-27": [ "vst~[7]", "vst~[4]", 0 ],
            "obj-8::obj-32": [ "vst~[8]", "vst~[4]", 0 ],
            "parameterbanks": {
                "0": {
                    "index": 0,
                    "name": "",
                    "parameters": [ "-", "-", "-", "-", "-", "-", "-", "-" ],
                    "buttons": [ "-", "-", "-", "-", "-", "-", "-", "-" ]
                }
            },
            "inherited_shortname": 1
        },
        "autosave": 0
    }
}