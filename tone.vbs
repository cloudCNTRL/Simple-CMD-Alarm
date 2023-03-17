Dim message

set message=CreateObject("sapi.spvoice")
set message.Voice=message.GetVoices.Item(1)

message.Volume=100
message.rate=0



message.Speak "!THE ALARM SYSTEM HAS TRIGGERED! WAKE UP! WAKE UP! WAKE UP! THE ALARM SYSTEM HAS TRIGGERED! WAKE! UP! WAKE THE FUCK UP"
