(**
 * Baseado em: http://docwiki.embarcadero.com/RADStudio/Tokyo/en/Tutorial:_Using_the_REST_Client_Library_to_Access_REST-based_Web_Services
 *)
unit MDN.RestClient;

interface

uses
  MDN.BaseClass,
  System.SysUtils,
  IPPeerClient,
  REST.Client,
  REST.Types,
  System.JSON;

type
  TMDNRestClient=class(TBaseClass)
  private
    FLastError: String;
    RestClient: TRESTClient;
    RestRequest: TRESTRequest;
    RestResponse: TRESTResponse;
  public
    constructor Create;
    destructor Destroy; override;
    function ExecuteRequest(BaseURL: String; Resource: String): TJSONValue;
    function CleanString(Valor: String): String;
    property LastError: String read FLastError;
  end;

implementation

{ TMDNRestClient }

function TMDNRestClient.CleanString(Valor: String): String;
begin
  Result := StringReplace(Valor, '"', '', [rfReplaceAll, rfIgnoreCase]);
end;

constructor TMDNRestClient.Create;
begin
  Self.FLastError   := EmptyStr;
  Self.RestClient   := TRESTClient.Create(nil);
  Self.RestRequest  := TRESTRequest.Create(nil);
  Self.RestResponse := TRESTResponse.Create(nil);
  Self.RestClient.AllowCookies            := True;
  Self.RestClient.FallbackCharsetEncoding := 'UTF-8';
  Self.RestClient.HandleRedirects         := True;
  Self.RestClient.UserAgent               := 'Embarcadero RESTClient/1.0';
  Self.RestRequest.Accept                 := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
  Self.RestRequest.AcceptCharset          := 'UTF-8, *;q=0.8';
  Self.RestRequest.Client                 := Self.RestClient;
  Self.RestRequest.Method                 := TRESTRequestMethod.rmGET;
  Self.RestRequest.Response               := Self.RestResponse;
  Self.RestRequest.SynchronizedEvents     := False;
  Self.RestRequest.Timeout                := 30000;
end;

destructor TMDNRestClient.Destroy;
begin
  Self.FLastError := EmptyStr;
  if Assigned(Self.RestResponse) then
    Self.RestResponse.Free;
  if Assigned(Self.RestRequest) then
    Self.RestRequest.Free;
  if Assigned(Self.RestClient) then
    Self.RestClient.Free;
  inherited;
end;

function TMDNRestClient.ExecuteRequest(BaseURL, Resource: String): TJSONValue;
begin
  try
    Self.RestClient.BaseURL   := BaseURL;
    Self.RestRequest.Resource := Resource;
    Self.RestRequest.Execute;
    Result := TJSONValue(Self.RestResponse.JSONValue.Clone);
    Self.FLastError := Self.RestResponse.ErrorMessage;
  except
    on E:Exception do
    begin
      Result := nil;
      Self.FLastError := E.ToString;
    end;
  end;
end;

end.
