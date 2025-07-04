Feature: [US_013] Bir yönetici olarak API bağlantısı üzerinden yeni bir course price plan kaydı
  olusturabilmek istiyorum.

  Scenario: [TC_13.1] /api/addPricePlan endpoint'ine gecerli auth bilgileri ve dogru datalar (title,dateRange,discount,
  capacity,webinar_id) ile bir POST  gönderildiginde dönen status code 200, response body remark  "success" ve
  Message "Successfully Added."olduğu doğrulama testi
    * Api kullanicisi "admin" token ile base urli olusturur
    * Api kullanicisi "api/addPricePlan" path parametrelerini olusturur
    * Api kullanicisi api addPricePlan endpointine gondermek icin bir post request body hazirlar
    * Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * Api kullanicisi status codeun 200 oldugunu dogrular
    * Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * Api kullanicisi response bodydeki Message bilgisinin "Successfully Added." oldugunu dogrular


  Scenario: [TC_13.2] /api/addPricePlan endpoint'ine gecerli auth bilgileri ve data icermeyen bir POST request
  gönderildiginde dönen status code'un 422 oldugu ve response body'deki message'in
  "The title field is required. (and 3 more errors)" oldugu dogrulanma testi
    * Api kullanicisi "admin" token ile base urli olusturur
    * Api kullanicisi "api/addPricePlan" path parametrelerini olusturur
    * Api kullanicisi api/addPricePlan endpointine gondermek için data içermeyen bir post request hazirlar
    * Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * Api kullanicisi status codeun 422 oldugunu dogrular
    * Api kullanicisi response bodydeki message bilgisinin "The title field is required. (and 3 more errors)" oldugunu dogrular


  Scenario: [TC_13.3] /api/addPricePlan endpoint'ine gecersiz auth bilgileri ile dogru datalar iceren bir POST body
  gönderildiginde dönen status cod 401 oldugu ve response body'deki message "Unauthenticated." oldugu dogrulanma testi
    * Api kullanicisi "admin" token ile base urli olusturur
    * Api kullanicisi "api/addPricePlan" path parametrelerini olusturur
    * Api kullanicisi api addPricePlan endpointine gondermek icin bir post request body hazirlar
    * Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * Api kullanicisi status codeun 401 oldugunu dogrular
    * Api kullanicisi response bodydeki message bilgisinin "Unauthenticated." oldugunu dogrular


  Scenario: [TC_13.4] API aracılığıyla yeni oluşturulan yeni course price plan kaydinin var olduğunu, response body'deki
  Updated Price Plans ID ile /api/addPricePlan/{id} adresine bir GET isteği göndererek doğrulama testi
    * Api kullanicisi "admin" token ile base urli olusturur
    * Api kullanicisi "api/addPricePlan/id" path parametrelerini olusturur
    * Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * Api kullanicisi status codeun 200 oldugunu dogrular
    * Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular