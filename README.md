# Control-Monitors-Input-Via-Keyboard
This is mostly collection of tools that enables user to control which input should your monitor accept(instead of using KVM or manually change it in your monitor).

## Background
I was looking into controlling my monitor input, which I usually switch between PC & Laptop. I always thought there is only **KVM solution**(little thingy that you press to switch connection) or change it in **monitor's control menu**. **Hopefully**, this will save time to someone that will have same issue. I have KVM, but it is unreliable & it's lowering results of viewed image.

I've came accros [reddit post](https://www.reddit.com/r/buildapc/comments/8hgwir/how_to_switch_inputs_on_my_monitor_without_using/), where one guy points out it is possible to be done via keybord for many monitors nowdays, you need to have DDC, let me copy vital parts:
#### Question
```txt
How to switch inputs on my monitor without using the physical buttons?

As I was upgrading my PC I got my first monitor with the ability to switch to different HDMI inputs (linked below). I decided to plug my Chromecast and my Switch into it so I can do everything from one monitor. However, it's a bit of a pain to use the physical buttons on the monitor to switch inputs.

Is there any other way to do it? I know the monitor doesn't have an IR receiver, but what about software solutions that I could install on my PC? Any help would be appreciated!

https://www.acer.com/ac/en/US/content/model/UM.UX1AA.001
```

#### Reply

```md

pimlottc
•
10mo ago
• Edited 4mo ago

Almost all modern monitors support something called [Display Data Channel](https://en.wikipedia.org/wiki/Display_Data_Channel) (DDC) that should allow you to do this. You just need the appropriate utility to send DDC messages to your monitor.

For Windows, there's [NirSoft ControlMyMonitor](https://www.nirsoft.net/articles/set_monitor_input_source_command_line.html)

For macOS, there's [BetterDisplay](https://github.com/waydabber/BetterDisplay)

```

Soo important links:
  * [Display Data Channel](https://en.wikipedia.org/wiki/Display_Data_Channel)
  * [NirSoft ControlMyMonitor](https://www.nirsoft.net/articles/set_monitor_input_source_command_line.html)
  * [BetterDisplay](https://github.com/waydabber/BetterDisplay)

### Summary
And it is really working. Though you need to do following steps:
  1. Donwload corresponding app(I've used only **NirSoft ControlMyMonitor**)(#PraiseTheGod)
  2. Check InputSelect property, which possible values there are
      * Later used to prepared shortcuts specifically for required input
      * I had tree DVI, HDMI, DP
  3. Try them, to make sure, you know, which value represents, which input
  4. Create script/bat(ch)/bash file that will call monitor to change main input to desired one
      * ``` bat
        E:/Tools/custom-shortcuts/monitor-switch/ControlMyMonitor.exe /SetValue "\\.\DISPLAY2\Monitor0" 60 15
        ``` 
        I've used absolute path, where as 15 stands for DP port
  6. Find out which, Shortcut tool you want to use ( I've used AutoHotKey) for setting up shortcut that will lunch 
  7. Prepare script that is used in Shortcut tool (keybind to execute script file from no.4)
  8. Add it to Start-Up so it will be ready to detect

Important note - It is **not** one directional, but bi-directional.
E.g. Lets say I'm right now at **state PC-Monitor**. A press command(shortcut) to change to Laptop from **PC keyboard**.
**state Laptop-Monitor**. I  press 2nd command(shortcut) to change to PC from **PC keyboard**.
**state PC-Monitor**. You don't need that tool at both devices :).

HF, maybe later, I will add more detailed info.
