unit MDN.Download;

interface

uses
  MDN.BaseClass,
  System.Classes,
  System.Net.HttpClient,
  System.SysUtils,
  System.IOUtils,
  Generics.Collections;

type
  TDownload=class(TBaseClass)
  private
  public
    function Download(URL: String; Destination: String): Boolean;
  end;

implementation

{ TDownload }

function TDownload.Download(URL, Destination: String): Boolean;
var
  Client: THTTPClient;
  Response: IHTTPResponse;
  FileStream: TFileStream;
begin
  Client := THTTPClient.Create;
  try
    FileStream := TFileStream.Create(Destination, fmCreate);
    try
      Response := Client.Get(URL, FileStream);
      FileStream.Seek(0, TSeekOrigin.soBeginning);
    finally
      Response := nil;
      if Assigned(FileStream) then
        FileStream.Free;
    end;
  finally
    if Assigned(Client) then
      Client.Free;
  end;
end;

end.
