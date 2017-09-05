unit MDN.Criptografy;

interface

uses
  MDN.BaseClass;

type
  TCriptografy = class(TBaseClass)
  private
  public
    function HashStringToMD5(Value: String): String;
  end;

implementation

{ TCriptografy }

uses
  IdHashMessageDigest; // MD5

function TCriptografy.HashStringToMD5(Value: String): String;
var
  MD5: TIdHashMessageDigest5;
begin
  MD5 := TIdHashMessageDigest5.Create;
  try
    Result := (MD5.HashStringAsHex(Value) );
  finally
    MD5.Free;
  end;
end;

end.
