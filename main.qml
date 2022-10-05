import QtQuick
import QtQuick.Controls 2.15
import "RemoteResource.js" as RemoteData

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Homework 6 part 2")

    Component.onCompleted: RemoteData.getData()

    Row{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: btn.top
        anchors.bottomMargin: 10
        spacing: 10

        Column{
            spacing: 10

            ComboBox{
                id: fromComboBox
                width: textFieldSumm.width
                onFocusChanged: model = RemoteData.nameArray
            }

            TextField{
                id: textFieldSumm

                width: 80

                placeholderText: qsTr("Amount")

                focus: true

                Keys.onEnterPressed: btn.clicked()
                Keys.onReturnPressed: btn.clicked()

                validator: RegularExpressionValidator{
                    regularExpression: /[0-9]+/
                }
            }

        }

        Column{
            spacing: 10
            Label{
                text: "->"
            }

            Label{
                text: "->"
            }


        }

        Column{
            spacing: 10

            ComboBox{
                id: toComboBox
                width: label.width
                onFocusChanged: model = RemoteData.nameArray
            }

            Label{
                id: label
                width: 80
            }

        }
    }

    Button{
        id: btn
        anchors.centerIn: parent
        text: qsTr("Calculate")

        enabled: textFieldSumm.text !== "" &&
                 fromComboBox.currentText!== "" &&
                 toComboBox.currentText !== ""
        onClicked: {

            var currency1 = RemoteData.getValueByName(fromComboBox.currentText)
            var currency2 = RemoteData.getValueByName(toComboBox.currentText)
            var summ = textFieldSumm.text

            var result = currency2 * summ / currency1
            label.text = result.toFixed(2)

        }
    }
}
