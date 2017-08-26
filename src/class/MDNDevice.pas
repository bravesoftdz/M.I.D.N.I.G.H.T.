unit MDNDevice;

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
  MDNBaseClass,
  SysUtils;

type
  TDevice=class(TBaseClass)
  private
    FIMEI: String;
    procedure SetIMEI(const Value: String);
    function FindIMEI: String;
    function FindIMEIAndroid: String;
    function FindIMEIiOS: String;
    function FindIMEILinux: String;
    function FindIMEIMacOS: String;
    function FindIMEIWindows: String;
  public
    constructor Create;
    property IMEI: String read FIMEI write SetIMEI;
  end;

implementation

{ TDevice }

constructor TDevice.Create;
begin
  inherited;
  Self.IMEI := FindIMEI;
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
  obj: JObject;
  tm: JTelephonyManager;
  {$ENDIF}
  identifier: String;
begin
  identifier := EmptyStr;
  {$IFDEF ANDROID}
  obj := SharedActivityContext.getSystemService(TJContext.JavaClass.TELEPHONY_SERVICE);
  if obj <> nil then
  begin
    tm := TJTelephonyManager.Wrap( (obj as ILocalObject).GetObjectID );
    if tm <> nil then
      identifier := JStringToString(tm.getDeviceId);
  end;
  if identifier = '' then
    identifier := JStringToString(
      TJSettings_Secure.JavaClass.getString(
        SharedActivity.getContentResolver,
        TJSettings_Secure.JavaClass.ANDROID_ID));
  {$ENDIF ANDROID}

  Result := identifier;
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

procedure TDevice.SetIMEI(const Value: String);
begin
  FIMEI := Value;
end;

end.
