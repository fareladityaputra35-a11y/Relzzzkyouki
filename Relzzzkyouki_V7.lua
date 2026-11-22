local Players=game:GetService("Players")
local RS=game:GetService("RunService")
local UIS=game:GetService("UserInputService")
local LP=Players.LocalPlayer
local holder=(gethui and gethui()) or game:GetService("CoreGui")
pcall(function()
local o=holder:FindFirstChild("Relzzzkyouki")
if o then o:Destroy() end
end)
local S={Speed=false,SV=50,Noclip=false,Fly=false,FS=60,Up=false,Down=false,ESP=true,MD=5000,ITEM=true,ID=3000,FB=false,FBV=2,ALL=true}
local function hum() local c=LP.Character return c and c:FindFirstChildOfClass("Humanoid") end
local function root() local c=LP.Character return c and (c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("Torso")) end
local function new(cls,props,parent)
local i=Instance.new(cls)
for k,v in pairs(props) do i[k]=v end
i.Parent=parent
return i
end
local gui=new("ScreenGui",{Name="Relzzzkyouki",ResetOnSpawn=false})
local ok=pcall(function() gui.Parent=holder end)
if not ok then gui.Parent=LP:WaitForChild("PlayerGui") end
local main=new("Frame",{Size=UDim2.new(0,250,0,400),Position=UDim2.new(0.5,-125,0.15,0),BackgroundColor3=Color3.fromRGB(20,20,28),BorderSizePixel=0,Active=true},gui)
new("UICorner",{CornerRadius=UDim.new(0,10)},main)
new("UIStroke",{Color=Color3.fromRGB(170,60,255),Thickness=1.5},main)
local title=new("TextLabel",{Size=UDim2.new(1,-40,0,32),Position=UDim2.new(0,10,0,0),BackgroundTransparency=1,Text="Relzzzkyouki V7",Font=Enum.Font.GothamBold,TextSize=16,TextColor3=Color3.fromRGB(200,120,255),TextXAlignment=Enum.TextXAlignment.Left},main)
local minBtn=new("TextButton",{Size=UDim2.new(0,26,0,22),Position=UDim2.new(1,-32,0,5),BackgroundColor3=Color3.fromRGB(40,40,55),Text="-",Font=Enum.Font.GothamBold,TextSize=16,TextColor3=Color3.new(1,1,1)},main)
new("UICorner",{CornerRadius=UDim.new(0,6)},minBtn)
local body=new("ScrollingFrame",{Size=UDim2.new(1,0,1,-36),Position=UDim2.new(0,0,0,34),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y},main)
new("UIListLayout",{Padding=UDim.new(0,6),HorizontalAlignment=Enum.HorizontalAlignment.Center},body)
local dragging,dragStart,startPos
title.InputBegan:Connect(function(i)
if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
dragging=true dragStart=i.Position startPos=main.Position
end
end)
UIS.InputChanged:Connect(function(i)
if dragging and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
local d=i.Position-dragStart
main.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)
end
end)
UIS.InputEnded:Connect(function(i)
if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dragging=false end
end)
local mini=false
local function setMini(v)
mini=v
body.Visible=not v
main.Size=v and UDim2.new(0,250,0,32) or UDim2.new(0,250,0,400)
minBtn.Text=v and "+" or "-"
end
minBtn.MouseButton1Click:Connect(function() setMini(not mini) end)
UIS.InputBegan:Connect(function(i,gp)
if not gp and i.KeyCode==Enum.KeyCode.RightShift then setMini(not mini) end
end)
local function label(t)
new("TextLabel",{Size=UDim2.new(1,-20,0,18),BackgroundTransparency=1,Text=t,Font=Enum.Font.GothamBold,TextSize=12,TextColor3=Color3.fromRGB(170,100,240),TextXAlignment=Enum.TextXAlignment.Left},body)
end
local function toggle(t,default,cb)
local b=new("TextButton",{Size=UDim2.new(1,-20,0,32),Font=Enum.Font.GothamMedium,TextSize=14,TextColor3=Color3.new(1,1,1)},body)
new("UICorner",{CornerRadius=UDim.new(0,8)},b)
local on=default
local function paint()
b.Text=t.." : "..(on and "ON" or "OFF")
b.BackgroundColor3=on and Color3.fromRGB(120,40,200) or Color3.fromRGB(40,40,55)
end
paint()
b.MouseButton1Click:Connect(function()
on=not on
paint()
cb(on)
end)
end
local function row(lbl,def,mn,mx,step,cb)
local r=new("Frame",{Size=UDim2.new(1,-20,0,32),BackgroundTransparency=1},body)
new("TextLabel",{Size=UDim2.new(0,70,1,0),BackgroundTransparency=1,Text=lbl,Font=Enum.Font.Gotham,TextSize=13,TextColor3=Color3.fromRGB(210,210,220),TextXAlignment=Enum.TextXAlignment.Left},r)
local function btn(t,x)
local b=new("TextButton",{Size=UDim2.new(0,28,0,28),Position=UDim2.new(0,x,0,2),BackgroundColor3=Color3.fromRGB(40,40,55),Text=t,Font=Enum.Font.GothamBold,TextSize=16,TextColor3=Color3.new(1,1,1)},r)
new("UICorner",{CornerRadius=UDim.new(0,6)},b)
return b
end
local m=btn("-",72)
local box=new("TextBox",{Size=UDim2.new(0,60,0,28),Position=UDim2.new(0,104,0,2),BackgroundColor3=Color3.fromRGB(30,30,42),Text=tostring(def),Font=Enum.Font.GothamMedium,TextSize=14,TextColor3=Color3.new(1,1,1),ClearTextOnFocus=false},r)
new("UICorner",{CornerRadius=UDim.new(0,6)},box)
local p=btn("+",168)
local v=def
local function set(n)
n=math.clamp(math.floor(n),mn,mx)
v=n
box.Text=tostring(n)
cb(n)
end
m.MouseButton1Click:Connect(function() set(v-step) end)
p.MouseButton1Click:Connect(function() set(v+step) end)
box.FocusLost:Connect(function() set(tonumber(box.Text) or v) end)
set(def)
end
local flySet
local Lighting=game:GetService("Lighting")
local fbOrig=nil
local fbConn=nil
local fbAtmo={}
local function fbApply()
Lighting.Brightness=S.FBV
Lighting.ClockTime=14
Lighting.FogStart=1e9
Lighting.FogEnd=1e9
Lighting.GlobalShadows=false
Lighting.Ambient=Color3.fromRGB(200,200,200)
Lighting.OutdoorAmbient=Color3.fromRGB(200,200,200)
for _,v in ipairs(Lighting:GetChildren()) do
if v:IsA("Atmosphere") then
if fbAtmo[v]==nil then fbAtmo[v]=v.Density end
v.Density=0
end
end
end
local function fbSet(on)
S.FB=on
if on then
if not fbOrig then
fbOrig={Brightness=Lighting.Brightness,ClockTime=Lighting.ClockTime,FogStart=Lighting.FogStart,FogEnd=Lighting.FogEnd,GlobalShadows=Lighting.GlobalShadows,Ambient=Lighting.Ambient,OutdoorAmbient=Lighting.OutdoorAmbient}
end
if fbConn then fbConn:Disconnect() end
fbConn=RS.RenderStepped:Connect(fbApply)
else
if fbConn then fbConn:Disconnect() fbConn=nil end
if fbOrig then
for k,v in pairs(fbOrig) do
pcall(function() Lighting[k]=v end)
end
fbOrig=nil
end
for v,d in pairs(fbAtmo) do
pcall(function() v.Density=d end)
end
fbAtmo={}
end
end
label("MAP TERANG")
toggle("Fullbright (map terang)",false,fbSet)
row("Terang",S.FBV,1,10,1,function(v) S.FBV=v end)
label("SPEED + NOCLIP")
toggle("Speed",false,function(on)
S.Speed=on
if not on then local h=hum() if h then h.WalkSpeed=16 end end
end)
row("Kecepatan",S.SV,16,500,10,function(v) S.SV=v end)
toggle("Noclip (tembus tembok)",false,function(on) S.Noclip=on end)
label("FLY")
toggle("Fly",false,function(on) flySet(on) end)
row("Fly Speed",S.FS,10,500,10,function(v) S.FS=v end)
local ud=new("Frame",{Size=UDim2.new(1,-20,0,32),BackgroundTransparency=1},body)
local function hold(t,xs,key)
local b=new("TextButton",{Size=UDim2.new(0.5,-4,1,0),Position=UDim2.new(xs,xs==0 and 0 or 4,0,0),BackgroundColor3=Color3.fromRGB(40,40,55),Text=t,Font=Enum.Font.GothamMedium,TextSize=13,TextColor3=Color3.new(1,1,1)},ud)
new("UICorner",{CornerRadius=UDim.new(0,8)},b)
b.InputBegan:Connect(function(i)
if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then S[key]=true end
end)
b.InputEnded:Connect(function(i)
if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then S[key]=false end
end)
end
hold("Naik (E)",0,"Up")
hold("Turun (Q)",0.5,"Down")
label("ESP NPC (hologram merah)")
toggle("ESP NPC",true,function(on) S.ESP=on end)
row("Jarak NPC",S.MD,100,100000,500,function(v) S.MD=v end)
label("ESP BARANG (hologram biru)")
toggle("ESP Barang",true,function(on) S.ITEM=on end)
toggle("Semua interaksi",true,function(on) S.ALL=on end)
label("DIAGNOSA")
local diagStatus=new("TextLabel",{Size=UDim2.new(1,-20,0,18),BackgroundTransparency=1,Text="Terlacak: -",Font=Enum.Font.Gotham,TextSize=12,TextColor3=Color3.fromRGB(150,150,165),TextXAlignment=Enum.TextXAlignment.Left},body)
local diagBtn=new("TextButton",{Size=UDim2.new(1,-20,0,32),BackgroundColor3=Color3.fromRGB(40,40,55),Text="Scan benda sekitar (12m)",Font=Enum.Font.GothamMedium,TextSize=13,TextColor3=Color3.new(1,1,1)},body)
new("UICorner",{CornerRadius=UDim.new(0,8)},diagBtn)
local diagOut=new("TextLabel",{Size=UDim2.new(1,-20,0,200),BackgroundColor3=Color3.fromRGB(14,14,20),Text="Dekati barang, lalu tekan tombol Scan.",Font=Enum.Font.Code,TextSize=10,TextColor3=Color3.fromRGB(190,210,255),TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top},body)
row("Jarak barang",S.ID,100,100000,500,function(v) S.ID=v end)
UIS.InputBegan:Connect(function(i,gp)
if gp then return end
if i.KeyCode==Enum.KeyCode.E then S.Up=true end
if i.KeyCode==Enum.KeyCode.Q then S.Down=true end
end)
UIS.InputEnded:Connect(function(i)
if i.KeyCode==Enum.KeyCode.E then S.Up=false end
if i.KeyCode==Enum.KeyCode.Q then S.Down=false end
end)
RS.Heartbeat:Connect(function()
if S.Speed and not S.Fly then
local h=hum()
if h then h.WalkSpeed=S.SV end
end
end)
RS.Stepped:Connect(function()
if S.Noclip or S.Fly then
local c=LP.Character
if c then
for _,p in ipairs(c:GetDescendants()) do
if p:IsA("BasePart") and p.CanCollide then p.CanCollide=false end
end
end
end
end)
local bv,bg,fc
local function stopFly()
if fc then fc:Disconnect() fc=nil end
if bv then bv:Destroy() bv=nil end
if bg then bg:Destroy() bg=nil end
local h=hum()
if h then
h.PlatformStand=false
h:ChangeState(Enum.HumanoidStateType.GettingUp)
end
end
local function startFly()
stopFly()
local r,h=root(),hum()
if not r or not h then return end
h.PlatformStand=true
bv=Instance.new("BodyVelocity")
bv.MaxForce=Vector3.new(9e9,9e9,9e9)
bv.Velocity=Vector3.zero
bv.Parent=r
bg=Instance.new("BodyGyro")
bg.MaxTorque=Vector3.new(9e9,9e9,9e9)
bg.P=9e4
bg.CFrame=r.CFrame
bg.Parent=r
fc=RS.RenderStepped:Connect(function()
local rt,hm=root(),hum()
local cam=workspace.CurrentCamera
if not rt or not hm or not bv or not bg then return end
local mv=hm.MoveDirection
local vel=Vector3.zero
if mv.Magnitude>0 then
local lm=cam.CFrame:VectorToObjectSpace(mv)
vel=cam.CFrame:VectorToWorldSpace(Vector3.new(lm.X,0,lm.Z)).Unit*S.FS
end
if S.Up then vel=vel+Vector3.new(0,S.FS,0) end
if S.Down then vel=vel-Vector3.new(0,S.FS,0) end
bv.Velocity=vel
bg.CFrame=cam.CFrame
end)
end
flySet=function(on)
S.Fly=on
if on then startFly() else stopFly() end
end
LP.CharacterAdded:Connect(function()
task.wait(0.5)
if S.Fly then startFly() end
end)
local tracked={}
local items={}
local itemCount=0
local KW={"item","loot","drop","pickup","cash","money","crate","chest","coin","gem","reward","collect","safe","ammo","weapon"}
local function matchKW(n)
n=n:lower()
for _,k in ipairs(KW) do
if n:find(k,1,true) then return true end
end
return false
end
local function rootOf(m)
if m:IsA("BasePart") then return m end
return m:FindFirstChild("HumanoidRootPart") or m.PrimaryPart or m:FindFirstChildWhichIsA("BasePart")
end
local function inChar(inst)
local m=inst
while m and m~=workspace do
if m:IsA("Model") and m:FindFirstChildOfClass("Humanoid") then return true end
m=m.Parent
end
return false
end
local function untrack(m)
local t=tracked[m]
if t then
if t.hl then t.hl:Destroy() end
if t.bb then t.bb:Destroy() end
tracked[m]=nil
end
end
local function untrackItem(m)
local t=items[m]
if t then
if t.hl then t.hl:Destroy() end
if t.bb then t.bb:Destroy() end
items[m]=nil
itemCount=itemCount-1
end
end
local function trackModel(m,h)
if not m or not m:IsA("Model") or tracked[m] then return end
if Players:GetPlayerFromCharacter(m) then return end
local r=rootOf(m)
if not r then return end
local hl=Instance.new("Highlight")
hl.FillColor=Color3.fromRGB(255,0,0)
hl.OutlineColor=Color3.fromRGB(255,80,80)
hl.FillTransparency=0.5
hl.OutlineTransparency=0
hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
hl.Enabled=false
hl.Parent=m
local bb=Instance.new("BillboardGui")
bb.Adornee=r
bb.Size=UDim2.new(0,150,0,30)
bb.StudsOffset=Vector3.new(0,3.5,0)
bb.AlwaysOnTop=true
bb.Enabled=false
bb.Parent=gui
local lb=Instance.new("TextLabel")
lb.Size=UDim2.new(1,0,1,0)
lb.BackgroundTransparency=1
lb.Font=Enum.Font.GothamBold
lb.TextSize=13
lb.TextColor3=Color3.fromRGB(255,90,90)
lb.TextStrokeTransparency=0.3
lb.Text=m.Name
lb.Parent=bb
tracked[m]={hl=hl,bb=bb,lb=lb,root=r,hum=h,name=m.Name}
m.AncestryChanged:Connect(function(_,p)
if not p then untrack(m) end
end)
end
local function track(h)
trackModel(h.Parent,h)
end
local function pickTarget(inst)
local part=inst
if not part then return nil end
if part:IsA("Attachment") then part=part.Parent end
if not part then return nil end
if part:IsA("Model") then
local okk,sz=pcall(function() return part:GetExtentsSize() end)
if okk and sz.Magnitude<=40 then return part,rootOf(part) end
return nil
end
if part:IsA("BasePart") then
local m=part:FindFirstAncestorOfClass("Model")
if m and m~=workspace then
local okk,sz=pcall(function() return m:GetExtentsSize() end)
if okk and sz.Magnitude<=40 then return m,rootOf(m) end
end
return part,part
end
return nil
end
local function trackItem(t,a,name)
if not t or not a or items[t] or itemCount>=300 then return end
if t:IsDescendantOf(gui) or inChar(t) then return end
local hl=Instance.new("Highlight")
hl.FillColor=Color3.fromRGB(0,120,255)
hl.OutlineColor=Color3.fromRGB(120,200,255)
hl.FillTransparency=0.45
hl.OutlineTransparency=0
hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
hl.Enabled=false
hl.Parent=t
local bb=Instance.new("BillboardGui")
bb.Adornee=a
bb.Size=UDim2.new(0,150,0,24)
bb.StudsOffset=Vector3.new(0,2.5,0)
bb.AlwaysOnTop=true
bb.Enabled=false
bb.Parent=gui
local lb=Instance.new("TextLabel")
lb.Size=UDim2.new(1,0,1,0)
lb.BackgroundTransparency=1
lb.Font=Enum.Font.GothamBold
lb.TextSize=12
lb.TextColor3=Color3.fromRGB(90,170,255)
lb.TextStrokeTransparency=0.3
lb.Text=name
lb.Parent=bb
items[t]={hl=hl,bb=bb,lb=lb,adornee=a,name=name}
itemCount=itemCount+1
t.AncestryChanged:Connect(function(_,p)
if not p then untrackItem(t) end
end)
end
local GOOD={"take","pick","grab","collect","loot","steal","search","read","clue","note","paper","code","key","ambil","pungut","temukan","baca","petunjuk","kertas","catatan","kode","kunci","cari","periksa","pakai","use","equip","pasang","nyalakan","pegang"}
local BAD={"lock","gembok","padlock","pintu","door","gate","enter","exit","sit","talk","buy","shop","sell","vehicle","drive","bank","atm","heal","quest","teleport","spawn","bed","elevator","lift","masuk","keluar","duduk","beli","jual","keyboard","monitor"}
local function hasAny(s,list)
s=s:lower()
for _,k in ipairs(list) do
if s:find(k,1,true) then return true end
end
return false
end
local CS=game:GetService("CollectionService")
local IK={"kunci","key","petunjuk","clue","note","catatan","kertas","paper","camera","kamera","senter","flashlight","baterai","battery","mic","headset","headphone","obeng","tang","code","kode","item","pickup","loot","collect","ambil","interact","grab","take"}
local NK={"ghost","hantu","monster","enemy","entity","killer","chaser","boss","pocong","kunti","genderuwo","tuyul","hunter","musuh","windah"}
local function smallSize(d)
if d:IsA("BasePart") then return d.Size.Magnitude<=12 end
local okk,sz=pcall(function() return d:GetExtentsSize() end)
return okk and sz.Magnitude<=12
end
local function looksLikeItem(d)
if not (d:IsA("Model") or d:IsA("BasePart")) then return false end
if hasAny(d.Name,BAD) then return false end
if hasAny(d.Name,IK) then return smallSize(d) end
if not smallSize(d) then return false end
for _,tg in ipairs(CS:GetTags(d)) do
if hasAny(tg,IK) then return true end
end
for k,v in pairs(d:GetAttributes()) do
if hasAny(k,IK) then return true end
if type(v)=="string" and hasAny(v,IK) then return true end
end
return false
end
local function handle(d)
if d:IsA("Humanoid") then
track(d)
elseif d:IsA("ProximityPrompt") then
local t,a=pickTarget(d.Parent)
if t then
local txt=d.ActionText.." "..d.ObjectText
if hasAny(txt.." "..t.Name,BAD) then return end
local nm=t.Name
if d.ObjectText~="" then nm=d.ObjectText end
trackItem(t,a,nm.." ("..d.ActionText..")")
local e=items[t]
if e then e.good=hasAny(txt,GOOD) end
end
elseif d:IsA("Tool") then
if hasAny(d.Name,BAD) then return end
local a=d:FindFirstChild("Handle") or rootOf(d)
trackItem(d,a,d.Name)
if items[d] then items[d].good=true end
elseif d:IsA("ClickDetector") then
local t,a=pickTarget(d.Parent)
if t and not hasAny(t.Name,BAD) then
trackItem(t,a,t.Name.." (klik)")
if items[t] then items[t].good=true end
end
elseif d:IsA("AnimationController") then
trackModel(d.Parent,nil)
elseif d:IsA("Model") and hasAny(d.Name,NK) and rootOf(d) and not d:FindFirstChildOfClass("Humanoid") then
trackModel(d,nil)
elseif looksLikeItem(d) then
local t,a=pickTarget(d)
if t and not hasAny(t.Name,BAD) then
trackItem(t,a,t.Name)
if items[t] then items[t].good=true end
end
end
end
local function scan()
local list=workspace:GetDescendants()
for i,d in ipairs(list) do
pcall(handle,d)
if i%3000==0 then task.wait() end
end
end
task.spawn(scan)
workspace.DescendantAdded:Connect(function(d)
task.delay(0.5,function()
if d.Parent then pcall(handle,d) end
end)
end)
task.spawn(function()
while gui.Parent do
task.wait(20)
scan()
end
end)
local function byDist(a,b) return a[2]<b[2] end
local acc=0
RS.Heartbeat:Connect(function(dt)
acc=acc+dt
if acc<0.1 then return end
acc=0
local mr=root()
local pulse=0.45+0.2*math.sin(tick()*3)
local npcList={}
for m,t in pairs(tracked) do
if not t.root or not t.root.Parent then
untrack(m)
else
local show=false
if S.ESP and mr and (not t.hum or t.hum.Health>0) then
local d=(mr.Position-t.root.Position).Magnitude
if d<=S.MD then
show=true
t.lb.Text=t.name.." ["..math.floor(d).."m]"
npcList[#npcList+1]={t,d}
end
end
t.bb.Enabled=show
if not show then t.hl.Enabled=false end
end
end
table.sort(npcList,byDist)
for i,e in ipairs(npcList) do
e[1].hl.Enabled=i<=12
e[1].hl.FillTransparency=pulse
end
local itemList={}
for m,t in pairs(items) do
if not t.adornee or not t.adornee.Parent then
untrackItem(m)
else
local show=false
if S.ITEM and mr and (S.ALL or t.good) then
local d=(mr.Position-t.adornee.Position).Magnitude
if d<=S.ID then
show=true
t.lb.Text=t.name.." ["..math.floor(d).."m]"
itemList[#itemList+1]={t,d}
end
end
t.bb.Enabled=show
if not show then t.hl.Enabled=false end
end
end
table.sort(itemList,byDist)
for i,e in ipairs(itemList) do
e[1].hl.Enabled=i<=18
end
end)
task.spawn(function()
while gui.Parent do
task.wait(1)
local n=0
for _ in pairs(tracked) do n=n+1 end
diagStatus.Text="Terlacak: barang "..itemCount.." | NPC "..n
end
end)
diagBtn.MouseButton1Click:Connect(function()
local mr=root()
if not mr then
diagOut.Text="Karakter tidak ditemukan"
return
end
local found={}
local seen={}
for _,p in ipairs(workspace:GetDescendants()) do
if p:IsA("BasePart") and not (LP.Character and p:IsDescendantOf(LP.Character)) then
local d=(p.Position-mr.Position).Magnitude
if d<=12 then
local o=p
local m=p:FindFirstAncestorOfClass("Model")
if m and m~=workspace then
local ok2,sz=pcall(function() return m:GetExtentsSize() end)
if ok2 and sz.Magnitude<=30 then o=m end
end
if not seen[o] then
seen[o]=true
local mag=0
if o:IsA("BasePart") then
mag=o.Size.Magnitude
else
local ok3,sz2=pcall(function() return o:GetExtentsSize() end)
if ok3 then mag=sz2.Magnitude end
end
if mag<=20 then
local info=o.Name.." ["..o.ClassName.."] "..string.format("%.1f",mag).."s "..string.format("%.0f",d).."m"
local tg=CS:GetTags(o)
if #tg>0 then info=info.." tag:"..table.concat(tg,",") end
local ak={}
for k in pairs(o:GetAttributes()) do ak[#ak+1]=k end
if #ak>0 then info=info.." attr:"..table.concat(ak,",") end
local pr=o:FindFirstChildWhichIsA("ProximityPrompt",true)
if pr then info=info.." P:"..pr.ActionText.."/"..pr.ObjectText end
if o:FindFirstChildWhichIsA("ClickDetector",true) then info=info.." klik" end
info=info..(items[o] and " ESP" or " -")
found[#found+1]={d,string.sub(info,1,110)}
end
end
end
end
end
table.sort(found,byDist)
local lines={}
for i=1,math.min(12,#found) do
lines[#lines+1]=found[i][2]
print("[Scan] "..found[i][2])
end
if #lines==0 then lines[1]="Tidak ada benda kecil dalam 12m" end
diagOut.Text=table.concat(lines,"\n")
end)
print("[Relzzzkyouki V7] loaded")
