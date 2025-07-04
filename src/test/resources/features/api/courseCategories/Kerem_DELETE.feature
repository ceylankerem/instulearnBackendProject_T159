Feature: Bir yönetici olarak API baglantisi üzerinden belirtilen id numarasına sahip course price plan bilgilerini
  silebilmek istiyorum.

  Scenario: [TC_15.1] /api/deleteCategory/{id} endpoint'ine gecerli authorization bilgileri ve dogru (id) iceren bir DELETE request
  gönderildiginde dönen status code'in 200, response body'deki status bilgisinin "success" ve Message bilgisinin de
  "Successfully Deleted." oldugunu dogrulama testi
    * Api kullanicisi "admin" token ile base urli olusturur
    * Api kullanicisi "api/deletePricePlan/id" path parametrelerini olusturur
    * Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * Api kullanicisi status codeun 200 oldugunu dogrular
    * Api kullanicisi response bodydeki status bilgisinin "success" oldugunu dogrular
    * Api kullanicisi response bodydeki Message bilgisinin "Successfully Deleted." oldugunu dogrular

  Scenario: [TC_15.2] /api/deleteCategory/{id} endpoint'ine gecerli authorization bilgileri ve kaydı olmayan bir (id) iceren bir
  DELETE request gönderildiginde dönen status code'in 203, response body'deki remark bilgisinin "failed" ve
  message bilgisinin de "There is not category for this id." oldugu doğrulama testi
    * Api kullanicisi "admin" token ile base urli olusturur
    * Api kullanicisi "api/deletePricePlan/id" path parametrelerini olusturur
    * Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * Api kullanicisi status codeun 203 oldugunu dogrular
    * Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * Api kullanicisi response bodydeki Message bilgisinin "There is not ticket for this id." oldugunu dogrular


  Scenario: [TC_15.3] /api/deleteCategory/{id} endpoint'ine gecerli authorization bilgileri ve (id) içermeyen bir
  DELETE request gönderildiginde dönen status code'in 203, response body'deki remark bilgisinin "failed" ve
  message bilgisinin de "No id" oldugu doğrulama testi
    * Api kullanicisi "admin" token ile base urli olusturur
    * Api kullanicisi "api/deletePricePlan" path parametrelerini olusturur
    * Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * Api kullanicisi status codeun 203 oldugunu dogrular
    * Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * Api kullanicisi response bodydeki Message bilgisinin "No id" oldugunu dogrular


  Scenario: [TC_15.4] /api/deletePricePlan/{id} endpoint'ine gecersiz (invalid token) authorization bilgileri ile
  dogru (id) iceren bir DELETE request gönderildiginde dönen status code'in 401 oldugu ve response body'deki
  message bilgisinin "Unauthenticated." oldugunu dogrulama testi
    * Api kullanicisi "admin" token ile base urli olusturur
    * Api kullanicisi "api/deletePricePlan/<id>" path parametrelerini olusturur
    * Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * Api kullanicisi status codeun 401 oldugunu dogrular
    * Api kullanicisi response bodydeki message bilgisinin "Unauthenticated." oldugunu dogrular
    * Api kullanicisi DELETE request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular
    # 3,4 ve 5. step error verirse iptal, 6.step çalışacak.


  Scenario: /api/deletePricePlan/{id} endpoint'inden donen response body icindeki Deleted Price Plan Id bilgisinin
  /api/deletePricePlan/{id} endpoint'inde yazan id path parametresi ile ayni oldugu dogrulanmali.
    * Api kullanicisi "admin" token ile base urli olusturur
    * Api kullanicisi "api/deletePricePlan/id" path parametrelerini olusturur
    * Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * Api kullanicisi response bodydeki Deleted Price Plan Id bilgisinin, /api/deletePricePlan/{id} endpoint'inde yazan id path parametresi ile ayni oldugunu doğrular


   Scenario: API uzerinden silinmek istenen course price plan kaydinin silindigi, API uzerinden dogrulanma testi
     #(Response body'de dönen Deleted Price Plan Id ile /api/pricePlan/{id} endpoint'ine GET request gönderilerek kaydın silindiği doğrulanabilir.)
    * Api kullanicisi "admin" token ile base urli olusturur
    * Api kullanicisi "api/PricePlan/id" path parametrelerini olusturur
    * Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * Api kullanicisi response bodydeki message bilgisinin "There is not category for this id." oldugunu dogrular
