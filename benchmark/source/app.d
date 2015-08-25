import std.conv;
import std.datetime;
import std.stdio;

import jwtd.jwt;

version(UseBotan) {
	string private256 = q"EOS
-----BEGIN PRIVATE KEY-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCr5790wT0yuSWn
yG+HOqgCr4JYLI4dCuygyHK6qJ5OvdB9RG1Rj531VXQ2F+BJGtvOxgah05X6y6jm
Ov/OL/NMN8S8MWMhXPYd9/NPOuJD+ricXalmp9pL5y2qrrAhrkTTlptbiYrq/PVe
e6qLXC7wp9RmMQDlTxlrkykzgTo/rbjMzP43wL2TovI2ATc+v15T63uhtk1mdAIs
EXiDljFhD6alW8+tHlZmF9EJERPfCE8LSRHHLt/V0HGnGr3Pq519Q/lL9TJSqWJ4
x4Lpjz715qDsN//8aEdvwyVRSACVNeceE4t/WVQSqVZZwfElz2y1uAyw8I6W+S6t
AJXfoc5JAgMBAAECggEAW2TjwlQ2kDAlV/XVbcT+rCbZmr1ddQ1ozvajIKAjQmPi
Y6cso69CYLvlBBlfkh5ofJ+FySWv2F3M11LIy7tsk7oWq6NqO8OryjUYM6hvwYqb
+e5F8SEOi0pGWjdzxwRa7U9mG52dsN96KJiBDISfJC1mXEpzWnbaYfokbpCnAlEf
mJrFoJwBj7PFcN/U0lyou2UJB8/JwtPx89Y4VVSu1SdQbwMSbxXyvWgeHpSwJCyt
BsHbSpYl2JDGv1bauLDp478Scr2+xdepEbOtfK5oTbNl7OBRG2GBViI+l746sPJ5
RZ2mfVSiHQ+sXM+0tUSNikyZPlOkGRuEoFL/it7TnQKBgQDgmY7A5eD32R526zLl
yCGwRcjd8399RoCPad8/euMlosSIw5Kb+Y3wIMZ2g4peaGTvDW6ne/YAwATIpsh2
swBVz+b0aIo0+6I42Udlb/FAYGKX0xjzg2FZSzCDR+DvS7g6el/JiduucM+34Gko
g7SflbpPMOziIWiBOVqTLkHvtwKBgQDD8D+NkEjHJhQmB7G3tqiH9Zjd3+AeYDKK
aTSBrBCzMhAXjbjwcY+bdlMvwWhcAwI0UQC3Tew25siHJtLpsfP6CLY/+81QYavD
dt1dbiB5ahpkbB8OYqDQH+rvI4fcyEnWhKGaEibI3VAY+nd9y11prHvwmcZOblpc
gEBzV34x/wKBgEBurQ5XpEdWCTBSXwKefFOmYW6S+UMGI8GAvOPoLBvS6xDVEk0e
tYJq1KSRLfPRfQs7TkBMBpHGhFjPx/iNd44mm3oIN4Xlnm8ynhHSoGI4hHBLxf+t
9BJ6yIsQ5s2falWUX8BghR4xDNYSUfimd/3EJXOsdHiW3vUbcAmDHrVXAoGBAKtp
IOACSnjWSige8Q0r4XHXnFz1/oX0WCKX+NQ8J/vsHwHL/O90GVLCh/GuPFLKWwJT
ntG9fJlm+iSqBTdmc27Ycj+1VB8u4unDsdKLhiNRfDdAE0ctZ0vLsGZ2aePu4BGn
xAwaNw3f9rNzYleNMnJA78hDbqWsiqaDmF6POxoXAoGAEsj9YmS8/kgoJITjNII6
04wowxcMS/eUffQ7bPizLDYRPQQ0CKhAPC+vVz+wWzJSgHCcuYmHBjG6940Ethg1
+AsWwkm893VF6r6eLjt7byoqfaJEbsZm9y2mQi353PHIChq7CynEQSI+kaPP3V28
FIb2otyo1D4EXhfhvIH2K1A=
-----END PRIVATE KEY-----
EOS";
} else {
	string private256 = q"EOS
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAq+e/dME9Mrklp8hvhzqoAq+CWCyOHQrsoMhyuqieTr3QfURt
UY+d9VV0NhfgSRrbzsYGodOV+suo5jr/zi/zTDfEvDFjIVz2HffzTzriQ/q4nF2p
ZqfaS+ctqq6wIa5E05abW4mK6vz1Xnuqi1wu8KfUZjEA5U8Za5MpM4E6P624zMz+
N8C9k6LyNgE3Pr9eU+t7obZNZnQCLBF4g5YxYQ+mpVvPrR5WZhfRCRET3whPC0kR
xy7f1dBxpxq9z6udfUP5S/UyUqlieMeC6Y8+9eag7Df//GhHb8MlUUgAlTXnHhOL
f1lUEqlWWcHxJc9stbgMsPCOlvkurQCV36HOSQIDAQABAoIBAFtk48JUNpAwJVf1
1W3E/qwm2Zq9XXUNaM72oyCgI0Jj4mOnLKOvQmC75QQZX5IeaHyfhcklr9hdzNdS
yMu7bJO6FqujajvDq8o1GDOob8GKm/nuRfEhDotKRlo3c8cEWu1PZhudnbDfeiiY
gQyEnyQtZlxKc1p22mH6JG6QpwJRH5iaxaCcAY+zxXDf1NJcqLtlCQfPycLT8fPW
OFVUrtUnUG8DEm8V8r1oHh6UsCQsrQbB20qWJdiQxr9W2riw6eO/EnK9vsXXqRGz
rXyuaE2zZezgURthgVYiPpe+OrDyeUWdpn1Uoh0PrFzPtLVEjYpMmT5TpBkbhKBS
/4re050CgYEA4JmOwOXg99kedusy5cghsEXI3fN/fUaAj2nfP3rjJaLEiMOSm/mN
8CDGdoOKXmhk7w1up3v2AMAEyKbIdrMAVc/m9GiKNPuiONlHZW/xQGBil9MY84Nh
WUswg0fg70u4OnpfyYnbrnDPt+BpKIO0n5W6TzDs4iFogTlaky5B77cCgYEAw/A/
jZBIxyYUJgext7aoh/WY3d/gHmAyimk0gawQszIQF4248HGPm3ZTL8FoXAMCNFEA
t03sNubIhybS6bHz+gi2P/vNUGGrw3bdXW4geWoaZGwfDmKg0B/q7yOH3MhJ1oSh
mhImyN1QGPp3fctdaax78JnGTm5aXIBAc1d+Mf8CgYBAbq0OV6RHVgkwUl8CnnxT
pmFukvlDBiPBgLzj6Cwb0usQ1RJNHrWCatSkkS3z0X0LO05ATAaRxoRYz8f4jXeO
Jpt6CDeF5Z5vMp4R0qBiOIRwS8X/rfQSesiLEObNn2pVlF/AYIUeMQzWElH4pnf9
xCVzrHR4lt71G3AJgx61VwKBgQCraSDgAkp41kooHvENK+Fx15xc9f6F9Fgil/jU
PCf77B8By/zvdBlSwofxrjxSylsCU57RvXyZZvokqgU3ZnNu2HI/tVQfLuLpw7HS
i4YjUXw3QBNHLWdLy7Bmdmnj7uARp8QMGjcN3/azc2JXjTJyQO/IQ26lrIqmg5he
jzsaFwKBgBLI/WJkvP5IKCSE4zSCOtOMKMMXDEv3lH30O2z4syw2ET0ENAioQDwv
r1c/sFsyUoBwnLmJhwYxuveNBLYYNfgLFsJJvPd1Req+ni47e28qKn2iRG7GZvct
pkIt+dzxyAoauwspxEEiPpGjz91dvBSG9qLcqNQ+BF4X4byB9itQ
-----END RSA PRIVATE KEY-----
EOS";
}

string public256 = q"EOS
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAq+e/dME9Mrklp8hvhzqo
Aq+CWCyOHQrsoMhyuqieTr3QfURtUY+d9VV0NhfgSRrbzsYGodOV+suo5jr/zi/z
TDfEvDFjIVz2HffzTzriQ/q4nF2pZqfaS+ctqq6wIa5E05abW4mK6vz1Xnuqi1wu
8KfUZjEA5U8Za5MpM4E6P624zMz+N8C9k6LyNgE3Pr9eU+t7obZNZnQCLBF4g5Yx
YQ+mpVvPrR5WZhfRCRET3whPC0kRxy7f1dBxpxq9z6udfUP5S/UyUqlieMeC6Y8+
9eag7Df//GhHb8MlUUgAlTXnHhOLf1lUEqlWWcHxJc9stbgMsPCOlvkurQCV36HO
SQIDAQAB
-----END PUBLIC KEY-----
EOS";

version(UseBotan) {
	string es256_private = q"EOS
-----BEGIN PRIVATE KEY-----
MIGEAgEAMBAGByqGSM49AgEGBSuBBAAKBG0wawIBAQQgHxxA+0sQXmE4myibmhVT
l0ymANRHZBi4lNd22/F7NCWhRANCAAQy5KexZuIg/J8UAgC+VuWI85SdCWJtvrvI
TolSpdVp69vxmisrYd/F8WD2kZWGDdIa4EJsdwnzhYo5fcZIwTBw
-----END PRIVATE KEY-----
EOS";
} else {
	string es256_private = q"EOS
-----BEGIN EC PRIVATE KEY-----
MHQCAQEEIB8cQPtLEF5hOJsom5oVU5dMpgDUR2QYuJTXdtvxezQloAcGBSuBBAAK
oUQDQgAEMuSnsWbiIPyfFAIAvlbliPOUnQlibb67yE6JUqXVaevb8ZorK2HfxfFg
9pGVhg3SGuBCbHcJ84WKOX3GSMEwcA==
-----END EC PRIVATE KEY-----
EOS";
}

string es256_public = q"EOS
-----BEGIN PUBLIC KEY-----
MFYwEAYHKoZIzj0CAQYFK4EEAAoDQgAEMuSnsWbiIPyfFAIAvlbliPOUnQlibb67
yE6JUqXVaevb8ZorK2HfxfFg9pGVhg3SGuBCbHcJ84WKOX3GSMEwcA==
-----END PUBLIC KEY-----
EOS";

string hs_secret = "secret";

// none
void testNoneToken() {
	string noneToken = encode(["language": "D"], "", JWTAlgorithm.NONE);
	assert(noneToken == "eyJhbGciOiJub25lIiwidHlwIjoiSldUIn0.eyJsYW5ndWFnZSI6IkQifQ.");
	assert(verify(noneToken, ""));
}

// hs256
void testHS256Token() {
	string hs256Token = encode(["language": "D"], hs_secret, JWTAlgorithm.HS256);
	assert(hs256Token == "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsYW5ndWFnZSI6IkQifQ.utQLevAUK97y-e6B3-EnSofvTNAfSXNuSbu4moAh-hY");
	assert(verify(hs256Token, hs_secret));
}

// rs256
void testRS256Token() {
	string rs256Token = encode(["language": "D"], private256, JWTAlgorithm.RS256);
	assert(rs256Token == "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJsYW5ndWFnZSI6IkQifQ.BYpRNUNsho1Yquq7Uolp31K2Ng90h0hRlMV6J6d9WSSIYf7s2MBX2xgDlBuHtB-Yb9dkbkfdxqjYCQdWejiMc_II6dn72ZSBwBCyWdPPRNbTRA2DNlsoKFBS5WMp7iYordfD9KE0LowK61n_Z7AHNAiOop5Ka1xTKH8cqEo8s3ItgoxZt8mzAfhIYNogGown6sYytqg1I72UHsEX9KAuP7sCxCbxZ9cSVg2f4afEuwwo08AdG3hW_LXhT7VD-EweDmvF2JLAyf1_rW66PMgiZZCLQ6kf2hQRsa56xRDmo5qC98wDseBHx9f3PsTsracTKojwQUdezDmbHv90vCt-Iw");
	assert(verify(rs256Token, public256));
}

// es256
void testES256Token() {
	string es256Token = encode(["language": "D"], es256_private, JWTAlgorithm.ES256);
	assert(verify(es256Token, es256_public));
}

void main()
{
	writeln("Benchmark running...");
	auto res = benchmark!(
		() => testNoneToken(),
		() => testHS256Token(),
		() => testRS256Token(),
		() => testES256Token())(10_000);
	
	writefln("JWT None: \t%s", to!Duration(res[0]));
	writefln("JWT HS256: \t%s", to!Duration(res[1]));
	writefln("JWT RS256: \t%s", to!Duration(res[2]));
	writefln("JWT ES256: \t%s", to!Duration(res[3]));
}
