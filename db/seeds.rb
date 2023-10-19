10.times do |n|
  User.create!(firstname: "test#{n}", secondname: "test1#{n}", email: "test#{n}@gmail.com", password: "password", role: "charity")
end

charities = Charity.all
if charities.length == 0
puts "Seeding data"
Charity.create(
  name: "Innovations for Poverty Action",
  description: "Innovations for Poverty Action (IPA) is a global research and policy nonprofit focused on 
    finding and promoting effective solutions to global poverty. IPA collaborates with researchers 
    and decision-makers, conducting rigorous research in various sectors to improve the lives of marginalized
    populations worldwide.",
  image_url: "https://fordschool.umich.edu/sites/default/files/image/news/pjnppiasxgppcaxxpfbmfa-ipa_americas_logo_light.jpg",
  user_id:1
)

Charity.create(
  name: "Give Directly Inc",
  description: "GiveDirectly Inc. is a pioneering nonprofit that provides direct cash transfers to individuals
    in extreme poverty. By empowering recipients to make decisions about their lives, GiveDirectly enables 
    investments in education, healthcare, housing, and entrepreneurship. Their work demonstrates the impact
    of cash transfers in poverty alleviation.",
  image_url: "https://www.givedirectly.org/wp-content/uploads/2020/02/cropped-knowledge_graph_logo-1.jpg",
  user_id:2
)

Charity.create(
  name: "Oxfam International",
  description: "Oxfam International is a confederation of charitable organizations committed to combating
    global poverty and inequality. Operating in over 90 countries, Oxfam provides humanitarian relief,
    supports sustainable development, and advocates for transformative change. Their work encompasses
    hunger relief, gender equality, and advocating for marginalized communities.",
  image_url: "https://charity.org/wp-content/uploads/2021/12/Oxfam-logo.png.webp",
)

Charity.create(
  name: "Save the Children",
  description: "Save the Children is a global humanitarian organization dedicated to improving the lives of
   children in need. They provide healthcare, education, and emergency relief to vulnerable children 
   and their families in some of the world's most challenging environments.",
  image_url: "https://seeklogo.com/images/S/save-the-children-logo-43C2AB05D9-seeklogo.com.png",
  user_id:3
)

Charity.create(
  name: "CARE International",
  description: "CARE International is a leading humanitarian organization fighting global poverty and 
    providing assistance to communities in crisis. They work to address the root causes of poverty and 
    empower women and girls in marginalized communities.",
  image_url: "https://d1h79zlghft2zs.cloudfront.net/uploads/2019/07/1222-768x904.png",
  user_id:2
)

Charity.create(
  name: "The Global Red Cross Network",
  description: "The Global Red Cross Network comprises national Red Cross and Red Crescent societies worldwide, 
    united by their commitment to humanitarian principles. They provide emergency response,
    disaster relief, and support to those affected by conflicts and disasters.",
  image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQYoN0m2XMpWpVRUXvXO-Q-Y4XaGwlzPdmVCfdmjn7cvmqHXW4itjTZBQ_ftuek-C9okQ&usqp=CAU",
  user_id:1
)

Charity.create(
  name: "World Vision",
  description: "World Vision is an international Christian humanitarian organization dedicated to
    helping communities overcome poverty and injustice. They provide access to clean water,
    education, healthcare, and economic development programs.",
  image_url: "https://www.gbnews.ch/wp-content/gbnews-uploads/2014/09/worldvision.jpg",
  user_id:3
)

Charity.create(
  name: "United Relief Children Fund ",
  description: "United Relief Children Fund is dedicated to providing assistance and support to vulnerable 
  children around the world. Their mission is to ensure children have access to education, healthcare, and a
   safe environment, helping them lead healthier and brighter futures.",
  image_url: "https://www.aciafrica.org/image/q6hg4dzf_1677478365.webp",
  user_id:1
)

Charity.create(
  name: "Concern Worldwide",
  description: " Concern Worldwide is a humanitarian organization committed to tackling poverty, hunger, and
   inequality. With operations in many countries, Concern provides emergency relief, healthcare, education,
    and livelihood support to those in crisis.",
  image_url: "https://primson.org/dev/wp-content/uploads/2017/10/concern.gif",
  user_id:2  
)

Charity.create(
  name: "Outreach International",
  description: "Outreach International is focused on fighting poverty and empowering communities to create
   sustainable change. Through grassroots initiatives, they work with local partners to address issues such
    as education, healthcare, and economic development.",
  image_url: "https://us.123rf.com/450wm/aquaswim/aquaswim1108/aquaswim110800178/10298709-colorful-happy-hands.jpg?ver=6",
  user_id:3
)

Charity.create(
  name: "Gashem International",
  description: "Gashem International is committed to making a positive impact on underserved communities.
   They work to improve access to basic necessities like clean water, education, and healthcare,
    enhancing the quality of life for those in need.",
  image_url: "https://media.istockphoto.com/id/490400140/photo/hands-of-african-children-cupped-under-tap-drinking-water-malnutrition.jpg?s=612x612&w=0&k=20&c=rjQpRQi2ZMz1epgE2ikjGG5_2WHGD9-Yb6n_DiY--ps=",
  user_id:1
)

Charity.create(
  name: "Grace Projects for Change",
  description: "Grace Projects for Change is dedicated to ending poverty through a holistic
   approach. They implement projects that address education, healthcare, livelihoods, and 
   infrastructure development to uplift communities.",
  image_url: "https://us.123rf.com/450wm/carmendorin/carmendorin1406/carmendorin140600251/29390102-abstract-background-with-hand-prints-and-text-charity.jpg?ver=6",
  user_id:3
)

Charity.create(
  name: "The Bright Project",
  description: "The Bright Project is dedicated to bringing light to the lives of those in need.
   They focus on providing access to education, healthcare, and clean energy solutions to communities, 
   contributing to a brighter and more sustainable future.",
  image_url: "https://play-lh.googleusercontent.com/9n4ShwULL44yXU6GZU9ON-AZVAHAv0-s2tqq6ZiNktMbvQP8lvvaC7M5XclCLstVLWM=s320-rw",
  user_id:2
)

Charity.create(
  name: "Advocates for Men's Health",
  description: "Advocates for Men's Health is committed to promoting men's health and well-being.
   They provide education and resources to raise awareness about men's health issues and support
    research initiatives.",
  image_url: "https://nmcrisisline.com/wp-content/uploads/2023/07/Mens-Mental-Health-Awareness-Month.jpg",
  user_id:3
)

Charity.create(
  name: "Green Smile Foundation",
  description: "Green Smile Foundation is dedicated to environmental conservation and sustainability.
   They work on initiatives to protect the environment, promote eco-friendly practices, and
    educate communities about environmental issues.",
  image_url: "https://www.treehugger.com/thmb/zBYDOFxJRrAYbEIhMHulI7BNdNI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__mnn__images__2014__12__environmental-charities-92354c3f71b44ca3a3d6729194190eef.jpg",
  user_id:3
)

Charity.create(
  name: "African Anti-Poverty Network",
  description: "The African Anti-Poverty Network is a collective effort to combat poverty across the African
   continent. They collaborate with organizations and stakeholders to address poverty through various
    programs and initiatives.",
  image_url: "https://www.civilsociety.co.uk/static/3f882407-07c8-4ace-98655e09335142f7/article_img_detail_5ba532e110cf7bcee7b0d6e49c027c8b/poverty440.jpg",
  user_id:2
)

Charity.create(
  name: "Institute for Fight on Poverty",
  description: "The Institute for Fight on Poverty is dedicated to eradicating poverty through research,
   education, and community-based programs. They work tirelessly to empower individuals and communities,
    providing resources to break the cycle of poverty.",
  image_url: "https://images.fineartamerica.com/images/artworkimages/mediumlarge/2/lets-end-poverty-lets-reflect-on-a-shirt-saying-solving-poverty-hardship-poor-starvation-hard-roland-andres.jpg",
  user_id:3
)

Charity.create(
  name: "Kayole Rehabilitation Assistance Committee",
  description: "The Kayole Rehabilitation Assistance Committee is committed to rehabilitating and supporting 
  individuals and communities in need. They focus on various initiatives, including education, healthcare, 
  and social development, to improve lives.",
  image_url: "https://c8.alamy.com/comp/2K20NE6/medical-concept-on-a-blue-background-pills-capsules-and-puzzles-with-the-inscription-celebrate-recovery-2K20NE6.jpg",
  user_id:1
)

Charity.create(
  name: "Project HOPE",
  description: "Project HOPE is a global health and humanitarian organization dedicated to providing health 
  education and essential medical supplies to communities in need. Their mission is to make quality healthcare
   accessible to all.",
  image_url: "https://www.backabuddy.co.za/misc/charity/60d8fbb5f7602a94661134fece5e759a.jpg",
  user_id:2
)

Charity.create(
  name: "Free the Slaves",
  description: "Free the Slaves is committed to combating modern slavery and human trafficking.
   They work to liberate enslaved individuals, provide support for survivors, and advocate for policies
    to end human trafficking worldwide.",
  image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDUnoo1yHKANSq7Z8LfIgEyRXdrKW9pb61eDtJQHz9muRazw3kH0rZ7CiJe6Vz4JLZUvk&usqp=CAU",
  user_id:2
)

Charity.create(
  name: "Fight against Human Trafficking",
  description: "The Fight against Human Trafficking organization is dedicated to raising awareness about
   human trafficking and modern slavery. They engage in advocacy, support for survivors, and campaigns to 
   combat this global issue.",
  image_url: "https://healthaction.co.uk/wp-content/uploads/2020/08/humantraffic.png",
  user_id:3
)
puts "Done seeding"
end