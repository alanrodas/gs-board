model = table: [
  [ {}, {}, {}, {} ]
  [ {}, {}, {}, {} ]
  [ { black: 1 }, { blue: 87493312 }, { green: 2 }, {} ]
  [ { red: 3, black: 4 }, {}, {}, {} ]
]

modelWithAttire = table: [
  [ { green: 1 }, {}, {}, { blue: 1 } ]
  [ {}, { red: 4, black: 1 }, { red: 4, black: 2 }, {} ]
  [ {}, { red: 1 }, { red: 4, black: 3 }, {} ]
  [ { red: 1 }, {}, {}, { black: 1 } ]
]

Polymer
  is: '#GRUNT_COMPONENT_NAME'

  properties:

    model:
      type: Object
      value: model
      notify: true
    modelWithAttire:
      type: Object
      value: modelWithAttire
      notify: true
    jsonModel:
      type: Object
      value: model
    attire:
      type: Object
    attire2:
      type: Object

  ready: ->
    @attire = {
      "enabled": true,
      "rules": [
        {
          "when": { "blue": "*", "black": "+", "red": 4, "green": "*" },
          "image": "https://cloud.githubusercontent.com/assets/1631752/19217961/ef2e0d4c-8dea-11e6-960d-69585778f89d.png"
        },

        {
          "when": { "blue": 0, "black": 0, "red": 0, "green": 0 },
          "image": "https://cloud.githubusercontent.com/assets/1631752/19217956/ef1d928c-8dea-11e6-8b53-8d2495cdd3e9.png"
        },
        {
          "when": { "blue": 0, "black": 0, "red": 0, "green": 1 },
          "image": "https://cloud.githubusercontent.com/assets/1631752/19217959/ef27e822-8dea-11e6-9bb0-57892593c9d8.png"
        },

        {
          "when": { "blue": 1, "black": 0, "red": 0, "green": 0 },
          "image": "https://cloud.githubusercontent.com/assets/1631752/19217958/ef245892-8dea-11e6-80f4-aeb5d1862b1c.png"
        },

        {
          "when": { "blue": 0, "black": 1, "red": 0, "green": 0 },
          "image": "https://cloud.githubusercontent.com/assets/1631752/19217957/ef20120a-8dea-11e6-825c-23e7773269b0.png"
        },

        {
          "when": { "blue": 0, "black": 0, "red": 1, "green": 0, "head": true },
          "image": "https://user-images.githubusercontent.com/1631752/33194059-c9794fb0-d0d5-11e7-81dc-65a0f7472a94.png"
        },

        {
          "when": { "blue": 0, "black": 0, "red": 1, "green": 0 },
          "image": "https://cloud.githubusercontent.com/assets/1631752/19217960/ef2ad3c0-8dea-11e6-8434-ff9152b76f3b.png"
        }
      ],
      "borders": {
        "bottom": "https://user-images.githubusercontent.com/1631752/37176618-94629ef6-2325-11e8-9e11-6cf6846bbbc3.png",
        "bottomLeft": "https://user-images.githubusercontent.com/1631752/37176647-9cb96b98-2325-11e8-9244-17e65f8236bc.png",
        "bottomRight": "https://user-images.githubusercontent.com/1631752/37176659-a85c71b6-2325-11e8-8698-952cfbdf73f5.png",
        "left": "https://user-images.githubusercontent.com/1631752/37176682-c09ae398-2325-11e8-90d6-d1793b8c20fd.png",
        "right": "https://user-images.githubusercontent.com/1631752/37176696-c8628ea0-2325-11e8-9fb0-39805f2b810d.png",
        "top": "https://user-images.githubusercontent.com/1631752/37176705-d5459ee6-2325-11e8-8100-23a4b89a064c.png",
        "topLeft": "https://user-images.githubusercontent.com/1631752/37176714-dec70f54-2325-11e8-9589-4b3feaa21a2f.png",
        "topRight": "https://user-images.githubusercontent.com/1631752/37176725-e747cbe6-2325-11e8-8c3b-873501ce0a18.png"
      }
    }

    @attire2 = {
      "enabled":false,
      "rules":[
        {
          "when":{
            "blue": 3,
            "black": 0,
            "red": 1,
            "green": 0
          },
          "text": "hey"
        },
        {
          "when":{
            "blue":"*",
            "black":"*",
            "red":"*",
            "green":"*"
          },
          "image":"https://user-images.githubusercontent.com/677436/39197564-2d4b04e6-47bb-11e8-82f2-814a62dafdf6.png"
        }
      ]
    };

    setTimeout(() =>
      @set "attire2.enabled", true
    , 500)

    setInterval(() =>
      @set "attire.enabled", not @attire.enabled
    , 2000)

  listeners:
    'jsoneditor.change': '_jsonChange'

  _jsonChange: ->
    @async @_forceRender, 0

  _forceRender: ->
    @model = null
    @async @_setModel, 0

  _setModel: ->
    @model = model
