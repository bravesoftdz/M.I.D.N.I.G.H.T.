unit MDN.Device;

interface

uses
  {$IFDEF ANDROID}
  Androidapi.Helpers,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Telephony,
  Androidapi.JNI.Provider,
  Androidapi.JNIBridge,
  {$ENDIF ANDROID}
  MDN.BaseClass,
  SysUtils;

type
  TDevice=class(TBaseClass)
  private
    function FindIMEI: String;
    function FindIMEIAndroid: String;
    function FindIMEIiOS: String;
    function FindIMEILinux: String;
    function FindIMEIMacOS: String;
    function FindIMEIWindows: String;
    function GetIMEI: String;
  public
    constructor Create;
    property IMEI: String read GetIMEI;
  end;

implementation

{ TDevice }

constructor TDevice.Create;
begin
  inherited;
end;

function TDevice.FindIMEI: String;
begin
  {$IFDEF ANDROID}
  Result := FindIMEIAndroid;
  {$ENDIF}
  {$IFDEF IOS}
  Result := FindIMEIiOS;
  {$ENDIF}
  {$IFDEF MACOS}
  Result := FindIMEIMacOS;
  {$ENDIF}
  {$IFDEF MSWINDOWS}
  Result := FindIMEIWindows;
  {$ENDIF}
  {$IFDEF LINUX}
  Result := FindIMEILinux;
  {$ENDIF}
end;

(***
 * Recupera a Identidade do dispositivo móvel (IMEI).
 * Inspirado em: http://www.synaptica.info/it/2014/03/27/retrive-the-imei-device-identification-from-your-android-device-with-delphi-xe5
 *)
function TDevice.FindIMEIAndroid: String;
var
  {$IFDEF ANDROID}
  Obj: JObject;
  TM: JTelephonyManager;
  {$ENDIF}
  IMEI: String;
begin
  IMEI := EmptyStr;
  {$IFDEF ANDROID}
  Obj := SharedActivityContext.getSystemService(TJContext.JavaClass.TELEPHONY_SERVICE);
  if Obj <> nil then
  begin
    TM := TJTelephonyManager.Wrap( (Obj as ILocalObject).GetObjectID );
    if TM <> nil then
      IMEI := JStringToString(TM.getDeviceId);
  end;
  if IMEI = '' then
    IMEI := JStringToString(
      TJSettings_Secure.JavaClass.getString(
        SharedActivity.getContentResolver,
        TJSettings_Secure.JavaClass.ANDROID_ID));
  {$ENDIF ANDROID}
  Result := IMEI;
end;

function TDevice.FindIMEIiOS: String;
begin
  raise Exception.Create('Not Supported');
end;

function TDevice.FindIMEILinux: String;
begin
  raise Exception.Create('Not Supported');
end;

function TDevice.FindIMEIMacOS: String;
begin
  raise Exception.Create('Not Supported');
end;

function TDevice.FindIMEIWindows: String;
begin
  raise Exception.Create('Not Supported');
end;

function TDevice.GetIMEI: String;
begin
  Result:= FindIMEI;
end;

end.
