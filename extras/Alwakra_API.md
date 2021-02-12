### HTTP POST REQUESTS ###


url: http://alwakra.com.qa/APP/login.php



# Login

flag: sync_data
type: login
data: username;;password

---------------------------------------------------------
sample output
---------------------------------------------------------

{"status":"0","msg":"اسم المستخدم/كلمة السر خاطئه. الرجاء المحاولة مرة اخرى","query":"SELECT * FROM tb_users_info WHERE username='test' and password='test'"}

---------------------------------------------------------


# List Pending Approval

flag: sync_data
type: get_pending_approval

---------------------------------------------------------
sample output
---------------------------------------------------------

{"photos":[{"sid":"eacd22fb33f958cbdf5d346d15652a8d","header":"test","username":"test","date":null,"approval_status":"pending","timestamp":"2019/02/20 09:12:29","image":"http://www.alwakra.com.qa/APP/media/images/","images":[],"category":"photos"},{"sid":"361e2f637184e69c723e76b12f2f0be0","header":"test photo","username":"test","date":null,"approval_status":"pending","timestamp":"2019/02/20 11:50:42","image":"http://www.alwakra.com.qa/APP/media/images/","images":[],"category":"photos"},{"sid":"e1bb04723720e89e019fbf0c00ad0f32","header":"test photo 2","username":"test","date":null,"approval_status":"pending","timestamp":"2019/02/20 11:51:45","image":"http://www.alwakra.com.qa/APP/media/images/","images":[],"category":"photos"},{"sid":"54884a6da584cc554b297092fa50c31b","header":"new test","username":"test","date":null,"approval_status":"pending","timestamp":"2019/02/20 11:54:33","image":"http://www.alwakra.com.qa/APP/media/images/","images":[],"category":"photos"}],"weddings":[
    
    {"sid":"594e3e6ae18c79933dd2e8b59e605fb1","header":"أفراح البوعينين","groom":"علي محمد علي الجابر البوعينين","father":"ابناءمحمد علي الجابر البوعينين","date":"2019/06/22","location":"الموقع","address":"قاعات الاحتفالات الوكرة قاعة رفم 5","mobile":"للإستفسار","username":"khater","timestamp":"2019/06/21 23:02:27","image":"http://www.alwakra.com.qa/APP/media/images/C1p5b7GaYqMQ5sGn","images":[],"category":"weddings","approval_status":"pending"}]}

---------------------------------------------------------


# List Suggestions and Complains

flag: sync_data
type: get_suggestions

---------------------------------------------------------
sample output
---------------------------------------------------------

{"delete_news":[{"sid":"تطبيق الوكرة","header":"تم بحمدلله ومنته إنشاء من تطبيق الوكرة الذي سوف يدعم العدد من الإفراد من حيث الأخبار الحصرية و الخدمات المتميزة","content":"","timestamp":"2016/10/06 07:31:46","image":"http://www.alwakra.com.qa/APP/media/images/","category":"delete_news"},{"sid":"خبر","header":"ريو دي جانيرو في 18 أغسطس /قنا/ بحضور سعادة الشيخ جوعان بن حمد آل ثاني رئيس اللجنة الأولمبية القطرية احتفلت البعثة القطرية في أولمبياد ريو 2016 بالإنجاز التاريخي الذي حققه البطل معتز برشم وتتويجه بالميدالية الفضية في مسابقة الوثب العالي ضمن منافسات ألعاب القوى . \nوعاشت البعثة القطرية أجواء من الفرحة والسعادة وتلقت العديد من التهاني بالإنجاز الكبير وعاش الجميع لحظات تتويج البطل القطري بمشاعر فياضة وعامرة بالفرح والسرور والفخر والاعتزاز بالإنجاز . \nواعتلى معتز برشم منصة الشرف الأولمبي وتم تقليده ب","content":"","timestamp":"2016/10/06 07:58:30","image":"http://www.alwakra.com.qa/APP/media/images/","category":"delete_news"},{"sid":"فودافون الوكرة","header":"هناك عرض ٦٠٪‏ خصومات على خدمات فودافون والعرض ساري لغاية ٦/٩/٢٠١٦","content":"","timestamp":"2016/10/06 07:59:17","image":"http://www.alwakra.com.qa/APP/media/images/","category":"delete_news"},{"sid":"أكاديمية قطر - الوكرة","header":"أكاديمية قطر - الوكرة مدرسة خاصة تخدم مجتمع الوكرة والمناطق المجاورة، وتتمثل رسالتها في تقديم أعلى مستوى تعليمي للطلاب يكتسبون من خلاله مهارات التفكير الناقد، ويحرصون على النهل من نبع العلم مدى الحياة، ليغدوا مواطنين مسؤولين يمتازون بسعة الأفق. أٌسِسَت أكاديمية قطر - الوكرة عام 2011 لتستقبل أول دفعة مؤلفة من 220 طالبًا وطالبة من مرحلة الحضانة وحتى الصف الثاني الابتدائي. وتقوم المدرسة بإضافة مرحلة دراسية كل عام، وسوف نستمر في التوسع حتى نصل للصف 12 في موعد أقصاه 2022. يقع الحرم المدرسي على بعد حو","content":"","timestamp":"2016/10/06 07:59:45","image":"http://www.alwakra.com.qa/APP/media/images/","category":"delete_news"},{"sid":"البلدية تخالف ٤ مطاعم","header":"قامت بلدية الوكرة بإغلاق ٤ مطاعم وذلك بعد التفتيش الروتيني و المتابعة الجادة من إدارة الرقابة","content":"","timestamp":"2016/10/06 08:00:37","image":"http://www.alwakra.com.qa/APP/media/images/","category":"delete_news"},{"sid":"آهالي الوكرة يطالبون بالحفاظ على «# ","header":"أطلق مغردون هاشتاق على موقع التواصل الاجتماعي «توتير» حمل إسم «#صدفة _الوكرة»، وذلك على خلفية قرار تحويل دوار الصدفة بمدينة الوكرة إلى إشارات ضوئية بهدف التخفيف من الزحام على الدوار، وفك الاختناقات المرورية في شوارع المدينة، وخاصة أن هذا الشارع أحد الشوارع الرئيسية بالمدينة وعادة ما يشهد تكدسات للسيارات في الصباح وفي أوقات الذروة المرورية. وجاء هدف المغردون من وراء إطلاق هذا الهاشتاق هو المطالبة بنقل الصدفة التي تعد أحد المعالم الأثرية من الدوار إلى مكان مناسب يحفظ لها مكانتها التاريخية وكونها ","content":"","timestamp":"2016/10/06 08:01:29","image":"http://www.alwakra.com.qa/APP/media/images/","category":"delete_news"},{"sid":"الوكرة تستعد ","header":"لإنشاء ملاعب جديدة","content":"","timestamp":"2016/10/06 08:02:17","image":"http://www.alwakra.com.qa/APP/media/images/","category":"delete_news"},{"sid":"cool","header":"new news","content":"","timestamp":"2016/10/06 08:02:29","image":"http://www.alwakra.com.qa/APP/media/images/","category":"delete_news"},{"sid":"hdhdh","header":"xbdbdh","content":"","timestamp":"2016/10/06 08:04:17","image":"http://www.alwakra.com.qa/APP/media/images/","category":"delete_news"},{"sid":"Qatar","header":"\nI would like to","content":"","timestamp":"2016/10/06 08:05:51","image":"http://www.alwakra.com.qa/APP/media/images/","category":"delete_news"},{"sid":"الدوحة","header":"مبروك ل نادي الوكرة","content":"","timestamp":"2016/10/06 08:06:32","image":"http://www.alwakra.com.qa/APP/media/images/","category":"delete_news"},{"sid":"تدشين التطبيق","header":"بحمدلله و قدرته اليوم يتم تدشين التطبيق","content":"","timestamp":"2016/10/30 01:44:12","image":"http://www.alwakra.com.qa/APP/media/images/","category":"delete_news"},{"sid":"تيست","header":"تيست","content":"","timestamp":"2016/10/30 01:44:58","image":"http://www.alwakra.com.qa/APP/media/images/","category":"delete_news"},{"sid":"تخيم في الوكرة","header":"بداء اليوم الموافقة على التخيم وفي أم الحول","content":"","timestamp":"2016/10/31 19:45:14","image":"http://www.alwakra.com.qa/APP/media/images/","category":"delete_news"}],"":[{"sid":"623fb789e88adf684c2b2afde07b5e4e","header":null,"content":null,"timestamp":"1970/01/01 03:00:00","image":"http://www.alwakra.com.qa/APP/media/images/t24XxfqVLuor9iCF","category":null}]}

---------------------------------------------------------


# Hide Suggestion

flag: sync_data
type: update_suggestions
data: {"sid":"xxxxx"}

---------------------------------------------------------
sample output
---------------------------------------------------------

{"delete_news":[{"sid":"تطبيق الوكرة","header":"تم بحمدلله ومنته إنشاء من تطبيق الوكرة الذي سوف يدعم العدد من الإفراد من حيث الأخبار الحصرية و الخدمات المتميزة","content":"","timestamp":"2016/10/06 07:31:46","image":"http://www.alwakra.com.qa/APP/media/images/","category":"delete_news"},{"sid":"خبر","header":"ريو دي جانيرو في 18 أغسطس /قنا/ بحضور سعادة الشيخ جوعان بن حمد آل ثاني رئيس اللجنة الأولمبية القطرية احتفلت البعثة القطرية في أولمبياد ريو 2016 بالإنجاز التاريخي الذي حققه البطل معتز برشم وتتويجه بالميدالية الفضية في مسابقة الوثب العالي ضمن منافسات ألعاب القوى . \nوعاشت البعثة القطرية أجواء من الفرحة والسعادة وتلقت العديد من التهاني بالإنجاز الكبير وعاش الجميع لحظات تتويج البطل القطري بمشاعر فياضة وعامرة بالفرح والسرور والفخر والاعتزاز بالإنجاز . \nواعتلى معتز برشم منصة الشرف الأولمبي وتم تقليده ب","content":"","timestamp":"2016/10/06 07:58:30","image":"http://www.alwakra.com.qa/APP/media/images/","category":"delete_news"},{"sid":"فودافون الوكرة","header":"هناك عرض ٦٠٪‏ خصومات على خدمات فودافون والعرض ساري لغاية ٦/٩/٢٠١٦","content":"","timestamp":"2016/10/06 07:59:17","image":"http://www.alwakra.com.qa/APP/media/images/","category":"delete_news"},{"sid":"أكاديمية قطر - الوكرة","header":"أكاديمية قطر - الوكرة مدرسة خاصة تخدم مجتمع الوكرة والمناطق المجاورة، وتتمثل رسالتها في تقديم أعلى مستوى تعليمي للطلاب يكتسبون من خلاله مهارات التفكير الناقد، ويحرصون على النهل من نبع العلم مدى الحياة، ليغدوا مواطنين مسؤولين يمتازون بسعة الأفق. أٌسِسَت أكاديمية قطر - الوكرة عام 2011 لتستقبل أول دفعة مؤلفة من 220 طالبًا وطالبة من مرحلة الحضانة وحتى الصف الثاني الابتدائي. وتقوم المدرسة بإضافة مرحلة دراسية كل عام، وسوف نستمر في التوسع حتى نصل للصف 12 في موعد أقصاه 2022. يقع الحرم المدرسي على بعد حو","content":"","timestamp":"2016/10/06 07:59:45","image":"http://www.alwakra.com.qa/APP/media/images/","category":"delete_news"},{"sid":"البلدية تخالف ٤ مطاعم","header":"قامت بلدية الوكرة بإغلاق ٤ مطاعم وذلك بعد التفتيش الروتيني و المتابعة الجادة من إدارة الرقابة","content":"","timestamp":"2016/10/06 08:00:37","image":"http://www.alwakra.com.qa/APP/media/images/","category":"delete_news"},{"sid":"آهالي الوكرة يطالبون بالحفاظ على «# ","header":"أطلق مغردون هاشتاق على موقع التواصل الاجتماعي «توتير» حمل إسم «#صدفة _الوكرة»، وذلك على خلفية قرار تحويل دوار الصدفة بمدينة الوكرة إلى إشارات ضوئية بهدف التخفيف من الزحام على الدوار، وفك الاختناقات المرورية في شوارع المدينة، وخاصة أن هذا الشارع أحد الشوارع الرئيسية بالمدينة وعادة ما يشهد تكدسات للسيارات في الصباح وفي أوقات الذروة المرورية. وجاء هدف المغردون من وراء إطلاق هذا الهاشتاق هو المطالبة بنقل الصدفة التي تعد أحد المعالم الأثرية من الدوار إلى مكان مناسب يحفظ لها مكانتها التاريخية وكونها ","content":"","timestamp":"2016/10/06 08:01:29","image":"http://www.alwakra.com.qa/APP/media/images/","category":"delete_news"},{"sid":"الوكرة تستعد ","header":"لإنشاء ملاعب جديدة","content":"","timestamp":"2016/10/06 08:02:17","image":"http://www.alwakra.com.qa/APP/media/images/","category":"delete_news"},{"sid":"cool","header":"new news","content":"","timestamp":"2016/10/06 08:02:29","image":"http://www.alwakra.com.qa/APP/media/images/","category":"delete_news"},{"sid":"hdhdh","header":"xbdbdh","content":"","timestamp":"2016/10/06 08:04:17","image":"http://www.alwakra.com.qa/APP/media/images/","category":"delete_news"},{"sid":"Qatar","header":"\nI would like to","content":"","timestamp":"2016/10/06 08:05:51","image":"http://www.alwakra.com.qa/APP/media/images/","category":"delete_news"},{"sid":"الدوحة","header":"مبروك ل نادي الوكرة","content":"","timestamp":"2016/10/06 08:06:32","image":"http://www.alwakra.com.qa/APP/media/images/","category":"delete_news"},{"sid":"تدشين التطبيق","header":"بحمدلله و قدرته اليوم يتم تدشين التطبيق","content":"","timestamp":"2016/10/30 01:44:12","image":"http://www.alwakra.com.qa/APP/media/images/","category":"delete_news"},{"sid":"تيست","header":"تيست","content":"","timestamp":"2016/10/30 01:44:58","image":"http://www.alwakra.com.qa/APP/media/images/","category":"delete_news"},{"sid":"تخيم في الوكرة","header":"بداء اليوم الموافقة على التخيم وفي أم الحول","content":"","timestamp":"2016/10/31 19:45:14","image":"http://www.alwakra.com.qa/APP/media/images/","category":"delete_news"}],"":[{"sid":"623fb789e88adf684c2b2afde07b5e4e","header":null,"content":null,"timestamp":"1970/01/01 03:00:00","image":"http://www.alwakra.com.qa/APP/media/images/t24XxfqVLuor9iCF","category":null}]}


---------------------------------------------------------

# Add news

flag: sync_data
type: add_news
data: {"header":"test","content":"test content","date":"2021-01-10","images":"image1;;image2;;image3","username":"test"}

---------------------------------------------------------
sample output
---------------------------------------------------------

{"status":"1","approval":"pending"}

---------------------------------------------------------

# Add event

flag: sync_data
type: add_event
data: {"header":"test","content":"test content","date":"2021-01-10","images":"image1;;image2;;image3","username":"test"}

---------------------------------------------------------
sample output
---------------------------------------------------------

{"status":"1","approval":"pending"}

---------------------------------------------------------

# Add Wedding

flag: sync_data
type: add_wedding
data: {"father":"mohammed","groom":"fahad","location":"gps_location","date":"2020-02-22","address":"doha, blok3","mobile":"99xx99xx","images":"image1"}

---------------------------------------------------------
sample output
---------------------------------------------------------

{"status":"1","approval":"pending"}

---------------------------------------------------------

# Add Consolation

flag: sync_data
type: add_consolation
data: {"bury_date":"2021/01/12","bury_time":"after Asr Prayer","bury_address":"Ceremony x","consolation_date":"2021/01/13","men_address":"wakra, block 2","men_location":"google_maps_address","men_mobile":"99x99x99x","women_address":"wakra, block 2","women_location":"google_maps_address","women_mobile":"998883333"}
---------------------------------------------------------
sample output
---------------------------------------------------------

{"status":"1","approval":"pending"}

---------------------------------------------------------

# Accept News

flag: sync_data
type: accept_news
data: {"category":"news","sid":"H324k5jhasdf9","header":"test","content":"test content","date":"2021-01-10","images":"image1;;image2;;image3","username":"test"}

---------------------------------------------------------
sample output
---------------------------------------------------------

{"status":"1","approval":"approved"}

---------------------------------------------------------

# Reject News

flag: sync_data
type: reject_news
data: {"category":"news","sid":"H324k5jhasdf9","header":"test","content":"test content","date":"2021-01-10","images":"image1;;image2;;image3","username":"test"}

---------------------------------------------------------
sample output
---------------------------------------------------------

{"status":"1","approval":"rejected"}

---------------------------------------------------------


# Get Services

flag: sync_data
type: get_services

---------------------------------------------------------
sample output
---------------------------------------------------------

JSON

---------------------------------------------------------


# Get a Service

flag: sync_data
type: get_service
data: b6beccfd20c20550f4012e08c93b151a (you can put any SID to get the service)

---------------------------------------------------------
sample output
---------------------------------------------------------

{
    "content": "توقيت العمل :- من يوم الأحد إلى الخميس:- 7:30 صباحاً إلى 1:00 مساءً \nهاتف خدمة العملاء:- 44456000\nالموقع الإلكتروني:-  <a href=\"http://www.dohabank.com.qa\">http://www.dohabank.com.qa</a>\n\n\n\n",
    "image": "http://alwakra.com.qa/APP/media/images/pXUZRBqvkEcTVLYi",
    "images": "pXUZRBqvkEcTVLYi",
    "location": "https://www.google.com/maps/place/Al+Wakra+Rd,+Al+Wakrah,+Qatar/@25.189175,51.597946,19z/data=!4m5!3m4!1s0x3e45cea8e93821ed:0x3232ffb61d455e9!8m2!3d25.1953904!4d51.594913",
    "SID": "b6beccfd20c20550f4012e08c93b151a"
}

---------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------




# Add Category

flag: sync_data
type: update_service
data: {"flag":"add_main","main":"value"}

---------------------------------------------------------


# Update Category

flag: sync_data
type: update_service
data: {"flag":"update_main","new":"value","old":"value"}

---------------------------------------------------------


# Delete Category

flag: sync_data
type: update_service
data: {"flag":"delete_main","main":"value"}

---------------------------------------------------------


# Add Sub Category 1

flag: sync_data
type: update_service 
data: {"flag":"add_sub1","main":"value", "sub1":"value"}

---------------------------------------------------------


# Update Sub Category 1

flag: sync_data
type: update_service 
data: {"flag":"update_sub1","main":"category","new":"value","old":"value"}

---------------------------------------------------------


# Delete Sub Category 1

flag: sync_data
type: update_service 
data: {"flag":"delete_sub1","main":"value","sub1":"value"}

---------------------------------------------------------


# Add Sub Category 2

flag: sync_data
type: update_service 
data: {"flag":"add_sub2","main":"value", "sub1":"value", "sub2":"value"}

---------------------------------------------------------


# Update Sub Category 2

flag: sync_data
type: update_service 
data: {"flag":"update_sub2","main":"category","sub1":"sub category 1","new":"value","old":"value"}

---------------------------------------------------------


# Delete Sub Category 2

flag: sync_data
type: update_service 
data: {"flag":"delete_sub2","main":"value","sub1":"value","sub2":"value"}

---------------------------------------------------------


# Add/Update Content

flag: sync_data
type: update_service 
data: {"flag":"add_content","main":"value", "sub1":"value", "sub2":"value","content":"html text"}

---------------------------------------------------------