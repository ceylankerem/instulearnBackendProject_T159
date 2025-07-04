Feature: [US_014] Bir yönetici olarak API baglantisi üzerinden belirtilen id numarasına sahip
  course price plan'in bilgilerini güncelleyebilmek istiyorum.


  Scenario: [TC_14.1] /api/updatePricePlan/{id} endpoint'ine gecerli authorization bilgileri ile dogru (id) ve
  dogru datalar (title, dateRange, discount, capacity, webinar_id) iceren bir PATCH body gönderildiginde dönen
  status code'in 200, response body'deki remark bilgisinin "success" ve Message bilgisinin de "Successfully Updated."
  oldugu dogrulanmali ve response body icindeki "Updated Category Id" bilgisinin endpointde yazan id path parametresi
  ile ayni oldugunu dogrulama testi
    * Api kullanicisi "admin" token ile base urli olusturur
    * Api kullanicisi "api/addPricePlan/id" path parametrelerini olusturur
    * Api kullanicisi api addPricePlan endpointine gondermek icin bir patch request body hazirlar
    * Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * Api kullanicisi status codeun 200 oldugunu dogrular
    * Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * Api kullanicisi response bodydeki Message bilgisinin "Successfully Updated." oldugunu dogrular
    * Api kullanıcısı response body icindeki "Updated Category Id" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular.


  Scenario: [TC_14.2] /api/updatePricePlan/{id} endpoint'ine gecerli authorization bilgileri ile dogru (id) ve
  data icermeyen bir PATCH request gönderildiginde dönen status code'in 203, response body'deki remark bilgisinin "failed"
  ve message bilgisinin de "There is no information to update." oldugunu doğrulama testi
    * Api kullanicisi "admin" token ile base urli olusturur
    * Api kullanicisi "api/addPricePlan/id" path parametrelerini olusturur
    * Api kullanicisi api addPricePlan endpointine gondermek icin bir patch request body hazirlar
    * Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * Api kullanicisi status codeun 203 oldugunu dogrular
    * Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * Api kullanicisi response bodydeki Message bilgisinin "There is no information to update." oldugunu dogrular


  Scenario:[TC_14.3] /api/updateCategory/{id} endpoint'ine gecerli authorization bilgileri ile kaydı olmayan bir (id)
  ve dogru data (title) iceren bir PATCH body gönderildiginde dönen status code'in 203, response body'deki
  remark bilgisinin "failed" ve message bilgisinin de "There is not category for this id." oldugunu doğrulama testi
    * Api kullanicisi "admin" token ile base urli olusturur
    * Api kullanicisi "api/addPricePlan/id" path parametrelerini olusturur
    * Api kullanicisi api addPricePlan endpointine gondermek icin bir patch request body hazirlar
    * Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * Api kullanicisi status codeun 203 oldugunu dogrular
    * Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * Api kullanicisi response bodydeki Message bilgisinin "There is not ticket for this id." oldugunu dogrular


  Scenario: [TC_14.4] /api/updatePricePlan/{id} endpoint'ine gecerli authorization bilgileri ile (id) icermeyen
  ve dogru datalar (title, dateRange, discount, capacity, webinar_id) iceren bir PATCH body gönderildiginde dönen
  status code'in 203, response body'deki remark bilgisinin "failed" ve message bilgisinin de "No id" oldugunu dogrulama
    * Api kullanicisi "admin" token ile base urli olusturur
    * Api kullanicisi "api/addPricePlan" path parametrelerini olusturur
    * Api kullanicisi api addPricePlan endpointine gondermek icin bir patch request body hazirlar
    * Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * Api kullanicisi status codeun 203 oldugunu dogrular
    * Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * Api kullanicisi response bodydeki Message bilgisinin "No id" oldugunu dogrular


  Scenario: [TC_14.5] /api/updatePricePlan/{id} endpoint'ine gecersiz (invalid token) authorization bilgileri ile
  dogru (id) ve dogru datalar (title, dateRange, discount, capacity, webinar_id) iceren bir PATCH body gönderildiginde
  dönen status code'in 401 oldugu ve response body'deki message bilgisinin "Unauthenticated." oldugunu dogrulama testi
    * Api kullanicisi "admin" token ile base urli olusturur
    * Api kullanicisi "api/addPricePlan/id" path parametrelerini olusturur
    * Api kullanicisi api addPricePlan endpointine gondermek icin bir patch request body hazirlar
    * Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * Api kullanicisi status codeun 401 oldugunu dogrular
    * Api kullanicisi response bodydeki message bilgisinin "Unauthenticated." oldugunu dogrular
    * Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular
    # 4, 5 ve 6. step hata verir ise onlar yoruma alınıp 7. step aktif olacak


  Scenario: [TC_14.6] /api/updatePricePlan/{id} endpoint'inden donen response body icindeki Updated Price Plans ID bilgisinin
  /api/updatePricePlan/{id} endpoint'inde yazan id path parametresi ile ayni oldugunu doğrulama testi
    * Api kullanicisi "admin" token ile base urli olusturur
    * Api kullanicisi "api/addPricePlan/id" path parametrelerini olusturur
    * Api kullanicisi api addPricePlan endpointine gondermek icin bir patch request body hazirlar
    * Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * Api kullanicisi response bodydeki Updated Price Plans ID bilgisinin, /api/updatePricePlan/{id} endpoint'inde yazan id path parametresi ile ayni oldugunu doğrular


  Scenario: [TC_14.7] API üzerinden güncellenmek istenen course price plan kaydinin güncellendiği, reponse body'de
  Updated Price Plans ID ile /api/addPricePlan/{id} endpoint'ine bir GET request göndererek doğrulama testi
    * Api kullanicisi "admin" token ile base urli olusturur
    * Api kullanicisi "api/addPricePlan/<id>" path parametrelerini olusturur
    * Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * Api kullanicisi "data.capacity" bilgisinin x oldugunu dogrular

