# virtual sink

#### load nodule

```pactl load-module module-null-sink sink_name=VirtualSink sink_properties=device.description="Virtual Audio Sink" media.class=Audio/Sink channel_map=front-left,front-right

```

#### - unload module

pactl list modules //find the id of module

##### kill module

pactl unload-module <module-id>
