//
//  ImpactModel.swift
//  Dev_Final
//
//  Created by Aidan Maddox on 4/24/19.
//  Copyright © 2019 Aidan Maddox. All rights reserved.
//

import Foundation

class ImpactModel{
    //create singleton instance
    static let shared = ImpactModel()
    
    var filepath:String

    //declare keys
    static let key1 = "name"
    static let key2 = "description"
    
    var keys:[String]
    private var impacts: [[String:String]]
    var currentIndex: Int?    //Initializes currentIndex to value nil
    
    init() {
        
        keys = ["name","description"]
        impacts = [[String:String]]()
        currentIndex = 0
        
        // find the Documents directory
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        
        filepath = url!.appendingPathComponent("impactmodels.plist").path
        print("filepath=\(filepath)")
        
        // check to see if the file exists
        if FileManager.default.fileExists(atPath: filepath) {
            // read from file
            do {
                let url = URL(fileURLWithPath: filepath)
                let urlData = try Data(contentsOf: url)
                let plist = try PropertyListSerialization.propertyList(from: urlData, options: .mutableContainers, format: nil)
                impacts = plist as! [[String:String]]
            } catch {
                print("Could not get data from file")
            }
        } else {
            var object = ["name": "Fair Trade", "description": "A social movement in which members advocate for higher prices to exporters of goods as well as higher environmental standards. This Model of Impact is especially relevant for producers who work with developing countries, but has been implemented/ advocated for in privileged nations as well. Fair Trade USA."]
            impacts.append(object)
            
            object = ["name": "Corporate Social Responsibility", "description": "An approach to marketing and human resources development leveraged by larger corporations in order to promote and inform their charitable donations while also engaging the general public as well as staff in the effort to be socially responsible to the global and local communities they serve. GOOD Corps, KFC, Pepsi, Enso."]
            impacts.append(object)
            
            object = ["name": "Open Data", "description": "A public initiative lead by several governments in the United States in order to make data about the region(s) they serve more accessible to the general public in order to inspire innovation and empathy for local concerns. City of Los Angeles, City of San Francisco."]
            impacts.append(object)
            
            object = ["name": "Nature + Water Preservation", "description": "Businesses that develop products and/or services with the specific purpose of preserving and protecting our environment as well as our water resources. Keep Tahoe Blue, Save the Redwoods."]
            impacts.append(object)
            
            object = ["name": "Farm to Table", "description": "A Model of Impact in the food industry, specifically leveraged by restaurants, in which the proprietor of an establishment will consciously direct his/ her purchases toward local farmers in order to reduce footprint while simultaneously supporting the local economy. Chapel Hill Farms."]
            impacts.append(object)
            
            object = ["name": "Conditional Discounts", "description": "A model that rewards customers at an online or brick and mortar establishment for good behavior/acts of kindness or heroism in order to incentive social impact Hummus Bar."]
            impacts.append(object)
            
            object = ["name": "Jobs for the Disabled", "description": "Products and/or services that are manufactured/offered in a manner that allows the business to employ a workforce that is faced with medical/health issues. Celebrate Autism, Rising Tide Car Wash."]
            impacts.append(object)
            
            object = ["name": "Stakeholder Engagement", "description": "Services that enable stakeholder assessment, education, engagement or collaboration in order to bring about sustainable actions. Clean Agency, Brown Flynn."]
            impacts.append(object)
            
            object = ["name": "Enable Transparency", "description": "Products or services that enable, promote and document transparency in sustainability actions. CDP, GRI."]
            impacts.append(object)
            
            object = ["name": "Managing Sustainability Risks", "description": "Products or services that measure and manage sustainability risks and opportunities. WRI, Clean Agency."]
            impacts.append(object)
            
            object = ["name": "Ethics and Integrity", "description": "Services or certifications recognizing and promoting ethical practices. Ethisphere Institute."]
            impacts.append(object)
            
            object = ["name": "ESG Investing", "description": "Investments made into companies that take materially significant environmental, social, and governance actions, not out of the kindness of their heart, but because they lead to greater long term growth. Morgan Stanley Institute for Sustainable Investing."]
            impacts.append(object)
            
            object = ["name": "Green Products", "description": "A model developing and manufacturing essential products that are designed to combat relevant environmental issues. method, RePEaT, Tesla."]
            impacts.append(object)
            
            object = ["name": "Generating Indirect Economic Impacts", "description": "A model in which a business’s products or services also enable infrastructure or community development. CocaCola’s water stewardship and community development programs."]
            impacts.append(object)
            
            object = ["name": "Responsible Sourcing", "description": "Products that are manufactured/developed from materials that are consciously and responsibly sourced in order to protect rare/ endangered materials/ environments and animals. Buy the Change."]
            impacts.append(object)
            
            object = ["name": "Recycle/Upcycle", "description": "Products that are generated from 100% reclaimed, recyclable or reusable materials. Atelier & Repairs, Icestone countertops."]
            impacts.append(object)
            
            object = ["name": "Cradle-to-Cradle Products", "description": "Products designed such that once consumed they are easily collected, segregated and converted to new products. Aluminium cans."]
            impacts.append(object)
            
            object = ["name": "Renewable Energy", "description": "Products that provide energy solutions and decrease our dependence on fossil fuels. Solar City."]
            impacts.append(object)
            
            object = ["name": "Energy Efficiency", "description": "Products that reduce emissions through improved efficiencies. Energy star products."]
            impacts.append(object)
            
            object = ["name": "Water Efficiency", "description": "Products that improve water use efficiency. Droplet."]
            impacts.append(object)
            
            object = ["name": "Water Quality:", "description": "Operations or products designed to preserve or improve water discharge quality. Levi’s operations."]
            impacts.append(object)
            
            object = ["name": "Biodiversity Protection:", "description": "Products or services that help preserve and replenish biodiversity. WWF."]
            impacts.append(object)
            
            object = ["name": "Emissions Reduction:", "description": "echnology or products that manage or emit less GHG to fight climate change. Vehicle lightweighting technology, carbon capture and storage."]
            impacts.append(object)
            
            object = ["name": "Offset Programs", "description": "Models that offer carbon offset programs to companies and individuals. Tree People, CoolEffect."]
            impacts.append(object)
            
            object = ["name": "Effluent and Waste Control", "description": "Products or operations that focus on controlling and managing effluents and waste. MDGBio."]
            impacts.append(object)
            
            object = ["name": "Supplier Environmental Assessment", "description": "Services that audit, provide certifications or support meeting environmental/ social regulations of suppliers. Fair Trade, SCS Certifications."]
            impacts.append(object)
            
            object = ["name": "Occupational Health and Safety", "description": "ervices or certifications that promote and check occupational health and safety. OSHA Standards."]
            impacts.append(object)
            
            object = ["name": "Labor Grievances", "description": "Products or services that track and tackle labor issues. Labor Link App."]
            impacts.append(object)
            
            object = ["name": "Child, Forced, or Compulsory Labor", "description": "Products or services that track and eliminate child, forced or compulsory labor. BSI Group’s Trafficking & Supply Chain Slavery Patterns Index."]
            impacts.append(object)
            
            object = ["name": "Local Community Engagement", "description": "Services that initiate engagement and education with local communities. Breakthrough India."]
            impacts.append(object)
            
            object = ["name": "Policy Support", "description": "Services that enable informing public policy around environmental/ social risks. EPA, WRI."]
            impacts.append(object)
            
            object = ["name": "Transparent product labeling & communication", "description": "Standards and services that enable transparent communications on products and packaging. FTC, Fair Trade, SPC."]
            impacts.append(object)
            
            object = ["name": "Environmental impact Assessments", "description": "Products or services that measure and devise strategies to manage environmental impacts. Simapro."]
            impacts.append(object)
            
            object = ["name": "CSR reporting", "description": "Automated reporting products or services to enable communication of sustainability practices in a manner of improving transparency and accountability. Measurabl, Clean Agency."]
            impacts.append(object)
            
            object = ["name": "Customer Safety", "description": "Products or services that inform, enhance and sustain customer safety. Xerox Corp."]
            impacts.append(object)
            
            object = ["name": "Product for Medical/Health Benefit", "description": "Businesses that develop products with the specific purpose to alleviate medical/health stress for their end users. Jerry the Bear, Medic Mobile, SwipeSense."]
            impacts.append(object)
            
            object = ["name": "Product to Benefit Low Income", "description": "Businesses that develop products with the specific purpose of assisting those in low-income/underserved communities. Delight Hearing Aids."]
            impacts.append(object)
            
            object = ["name": "Product for Use in Developing Countries", "description": "Businesses that develop products with the specific purpose of assisting those in developing countries. D.Light Design, SolSource, Off.Grid:Electric, SHE."]
            impacts.append(object)
            
            object = ["name": "Open Source Products (Hardware/Software)", "description": "Products that are typically available for free or for low cost that allow the end users to build upon an existing framework in order to develop new solutions that can scale across industry or region. Processing, Thingiverse, Arduino."]
            impacts.append(object)
            
            object = ["name": "Sliding Scale Cost", "description": "Products that are made available by companies at a sliding scale cost, which allows certain markets to subsidize those in need through their purchases. South Central Farmers Organic Cooperative, Clifton’s Cafeteria."]
            impacts.append(object)
            
            object = ["name": "Product for Service/Access", "description": "Products that subsidize access to important services for individuals/ communities/organizations in need. Often described as the necessary revision to the infamous “one for one” model. Stone + Cloth, re:char, LSTN Headphones."]
            impacts.append(object)
            
            object = ["name": "One for One", "description": "A model that allows customers to purchase a product that additionally sponsors a product of equal or lesser value to be sent to individuals/communities/ organizations in need. TOMS, One Laptop Per Child, BOGO Bowl."]
            impacts.append(object)
            
            object = ["name": "Percentage Inventory Donated", "description": "A model in which businesses dedicate a set percentage of their inventory to be donated to individuals/ communities/organizations in need. Microsoft, Kraft Foods, Google, Marriott International, Pfizer."]
            impacts.append(object)
            
            object = ["name": "One Plus One", "description": "A model in which businesses commit 1% of inventory and 1% of profits OR revenues to a cause of choice or to individuals/communities/organizations in need. Harry’s."]
            impacts.append(object)
            
            object = ["name": "1% for the planet", "description": "A commitment made by businesses to donate at least 1% of all profits to environmental causes. Aside from engaging in philanthropy on a micro-level, the model allows businesses to engage with like-minded colleagues for potential networking and collaboration. RA Partners, Patagonia, New Outlook Financial."]
            impacts.append(object)
            
            object = ["name": "Give-Half Profit/Revenue", "description": "A model in which a company in the service or product-oriented business space donates 50% of their profits or revenues on a yearly, quarterly,or more frequent basis. Latitude, Bridgeway Capital Management."]
            impacts.append(object)
            
            object = ["name": "100% Profit/Revenue", "description": "A model in which a company in the service or product-oriented business space donates 100% of their profits or revenues on a yearly, quarterly, or more frequent basis. This is most common amongst non-profit organizations or private foundations, but has been leveraged in the private sector, historically. Charity Water, Newman’s Own."]
            impacts.append(object)
            
            object = ["name": "Social Awareness", "description": "A business in the service or product- oriented business space that is dedicated to inventing products or delivering services that raise awareness around a significant cause or issue. Sevenly, Falling Whistles, KONY (Invisible Children), Buena Nota."]
            impacts.append(object)
            
            object = ["name": "Jobs for Transitional Communities", "description": "Products and/or services that are manufactured/offered in a manner that allows the business to employ a workforce that is in transition. Would-Works, Homeboy Industries."]
            impacts.append(object)
            
            object = ["name": "Jobs for Developing Countries", "description": "Products and/or services that are manufactured/offered in a manner that allows the business to create jobs in developing countries. Cross-over exists between “transitional communities” and “developing countries” when the glossary is taken out of the context of business in the United States, or other privileged nations. SHE, Apolis."]
            impacts.append(object)
            
            object = ["name": "Local Jobs", "description": "Products and/or services that are manufactured/offered in a manner that allows the business to create jobs in local communities. Caduceus Cellars."]
            impacts.append(object)
            
            object = ["name": "Glocalization", "description": "Especially prevalent amongst web 2.0 companies, the concept of “glocalization”, or “glocal” speaks to the intersection between trends/needs/ innovations that take place on a regional level with the growth of global corporations and globalism. McDonalds."]
            impacts.append(object)
            
            object = ["name": "Coworking", "description": "A growing alternative to dedicated office space for freelance economy practicioners and small businesses that is also commonly referred to as “shared work space”. Often found in urban environments, co- working spaces allow for collaboration and networking, and lower the cost of business operations for entrepreneurs. Impact HUB, WeWork, Cross Campus, Co+Hoots."]
            impacts.append(object)
            
            object = ["name": "Employee Engagement Programs", "description": "Businesses that pay special attention to employee engagement and benefits including paid time off to volunteer, profit-share, or flexible work environments that nurture personal development. Zappos, Ben & Jerry’s, Alvarado Street Bakery."]
            impacts.append(object)
            
            object = ["name": "Recycle/Upcycle", "description": "Products that are created from recycled materials OR products that are created from previously discarded materials. Also a model that can exist when a business or individual participates in, and advocates for, sustainable practices in the work place or home. Terracycle, Hipcycle, KEEN, Atayne."]
            impacts.append(object)
            
            object = ["name": "Conscious Sourcing", "description": "Products that are manufactured/ developed from materials that are consciously sourced in order to protect rare/endangered materials/ environments and animals. Buy the Change."]
            impacts.append(object)
            
            object = ["name": "Paperless Office", "description": "Services/offerings that pay special attention to the reduction of paper waste throughout an engagement. Efficient Technology Inc., Quickforms, Paychex."]
            impacts.append(object)
            
            object = ["name": "Irregular Contributions", "description": "rregular contributions are donations made throughout the year by businesses that are not necessarily donated in proportion to the revenue/ profit from that year. Kroger, Wall-Mart, Wells Fargo, Bank of America."]
            impacts.append(object)
            
            object = ["name": "Percentage of Profit/Revenue", "description": "A model in which a company in the service or product-oriented business space donates a pre-determined percentage of their profits or revenues on a yearly, quarterly, or more frequent basis. Product Red, Big Wheel Brigade."]
            impacts.append(object)
            
            object = ["name": "Social Action", "description": "A business in the service or product- oriented business space that is dedicated to inventing products or delivering services that inspire action around a significant cause or issue. Change.org, Thunderclap, Amicus."]
            impacts.append(object)
            
            object = ["name": "Impact Investing", "description": "Investments made into companies, organizations, and individuals with the intention of creating both a financial and social/environmental impact. Impact Investing typically focuses on emerging markets. Girls Helping Girls, New Incentives (Syetha Janumpalli), Imprint Capital."]
            impacts.append(object)
            
            object = ["name": "Crowd-Funding", "description": "A method of fundraising that activates a large group of people (the “crowd”) to make a mass of small donations/purchases that collectively fund a project or initiative. Start Some Good, Kickstarter, IndieGoGo, Patreon, Groundswell."]
            impacts.append(object)
            
            object = ["name": "Social Impact Bonds", "description": "A contract with the public sector in which a commitment is made to fund improvements in exchange for social outcomes that ultimately result in savings for the public sector. Goldman Sachs, Social Finance UK."]
            impacts.append(object)
            
            object = ["name": "Micro-Lending", "description": "Also known as micro-credit. This is a form of financing that allows the general public and private institutions to distribute very small loans to impoverished borrowers who typically lack collateral and a credit history that is verifiable. Kiva, Grameen Bank, MicroEnsure."]
            impacts.append(object)
            
            object = ["name": "Civic/Social Incubator or Accelerator", "description": "A specialized program that provides the training and resources required to assist entrepreneurs in the development/ launch of a product or service that creates social, civic, or environmental impact. Catapult, AshokaU, Singularity University, Code for America."]
            impacts.append(object)
            
            object = ["name": "The 100% Model", "description": "A model leveraged by non-profit organizations that allows all public donations to be invested in the cause/work of an organization as opposed to the overhead/operating costs. This is made possible through a distinguished committee/board that has committed to underwriting all operating costs for an organization. Charity Water, Dig Deep, Project Hope Worldwide, World of Children Award."]
            impacts.append(object)
            
            object = ["name": "20% Time", "description": "A work-flow/time-management model in which the staff members are encouraged to allocate a percentage (in this case 20%) of their time toward independent projects of their choice. This model was popularized by Google as a method for encouraging intrapreneurial endeavors within a large organization. Google."]
            impacts.append(object)
            
            object = ["name": "Access to Education", "description": "Products/services/initiatives/ programs with the specific purpose to make education and personal development more accessible and enjoyable for their end users. Leap Frog, No Right Brain Left Behind."]
            impacts.append(object)
            
            object = ["name": "Open Source (services)", "description": "Services and research findings or methodologies that have been made openly available for all individuals/companies/organizations to use freely. Vera Solutions, OneDegree, FSG."]
            impacts.append(object)
            
            object = ["name": "Promoting Creativity", "description": "Businesses that develop products and services with the specific purpose to promote creativity and innovation for their end users. These users can be companies as a whole, or individuals. As a service, this often takes the form of creative workshops. As a product, this often takes the form of books, toolkits, or other materials for making. Crayola, Lego."]
            impacts.append(object)
            
            object = ["name": "Non Skills-Based Volunteerism", "description": "A program, typically leveraged by large companies, in which employees are invited to join an expedition to give back to their community in a non skills-based approach (for example cleaning a beach). Sony, Target, Disney."]
            impacts.append(object)
            
            object = ["name": "Sharing Economy", "description": "A collaborative economy that is built around the concept of sharing physical or intellectual resources between peers. Burning Man, Task Rabbit, Uber, Lyft, Airbnb, Good Things Everywhere."]
            impacts.append(object)
            
            object = ["name": "Pro-Bono Publico", "description": "Literally means “for the good of the public”. A type of philanthropy in which businesses provide their time and knowledge at no cost to the beneficiary. Originally found in the legal industry in the late 1800s, pro-bono has grown to engage a diverse range of disciplines/industries in the service-oriented business space in in-kind philanthropy. verynice, Taproot Foundation, HP."]
            impacts.append(object)
            
            object = ["name": "Give Some Services", "description": "Businesses in the service-oriented business space that occasionally offer pro-bono services, but do not have a standardized/institutionalized amount of time or resources allocated. Deloitte, Bain and Company."]
            impacts.append(object)
            
            object = ["name": "Intermediary Pro-Bono/Volunteerism Platforms", "description": "An organization that serves as a connecting point between service providers or volunteers and organizations or communities in need. Taproot Foundation, Catchafire, MobileWorks, Volunteer Match."]
            impacts.append(object)
            
            object = ["name": "The 1% Program", "description": "A business model popularized in the architecture discipline in which firms make a commitment to donate 1% of all time/resources toward pro-bono projects to better the community. Gensler, Cannon Architects."]
            impacts.append(object)
            
            object = ["name": "Pro-Bono Marathons", "description": "Also known as “done in a day.” A model in which service-providers undertake a pro-bono project in one intensive session that typically lasts for 24 hours and leverages all human resources for that day to maximize impact. Global Service Jam, CreateAthon."]
            impacts.append(object)
            
            object = ["name": "Loaned Employee Program", "description": "A program, typically leveraged by large companies, in which employees are “loaned” for a temporary/pre-determined period of time to a non-profit organization in order to complete a project or solve an organizational problem from an outsider perspective. Loaned employee programs can also take place over a shorter time period in the form of a mentorship or tutoring program for children, students, and/or communities in need. PWC, Microsoft, IBM."]
            impacts.append(object)
            
            object = ["name": "Sliding Scale Rates", "description": "Rates for services that are defined by a company/practitioner on a sliding scale basis, which allows certain markets to subsidize those in need through their purchases. Often described as “partial pro- bono”. Planned Parenthood."]
            impacts.append(object)
            
            object = ["name": "Give Half Services", "description": "A model that allows service-providers to increase company bandwidth while simultaneously lowering overall company overhead in order to allocate time and resources toward a 50% pro-bono commitment. verynice, No Typical Moments, Impact Rising, Photon Factory."]
            impacts.append(object)
            
            object = ["name": "Cooperative", "description": "Cooperatives represent a voluntary group of people who work together to share mutual benefits. Cooperatives are often categorized in three ways: consumer, worker, and housing. A consumer cooperative is a business or organization that is owned by the people who use the services. A worker cooperative is a business or organization that is owned by the people who work for the company. A housing cooperative is a business or organization that is owned by the people who live in the space itself. Aside from ownership, cooperatives also tend to have their own unique mission/vision which the community they create hopes to accomplish/represent. United states Federation of Worker Cooperatives, Raiffeisen, Rochdale Society of Equitable Pioneers."]
            impacts.append(object)
            
            object = ["name": "Personal Development", "description": "Personal Development is a Model of Impact that allows the owner of a lifestyle enterprise or the consumer of a small or large business to develop themselves on a personal level via the accumulation of necessary skills or experiences to aid the advancement of their career/life."]
            impacts.append(object)
            
            object = ["name": "Personal Wealth", "description": "Personal Wealth is a Model of Impact and common motivator for many entrepreneurs and independent professionals. By creating multiple revenue streams, and by defining a structure for passive income, individuals can achieve personal wealth."]
            impacts.append(object)
            
            object = ["name": "Family Legacy", "description": "Family Legacy is a Model of Impact and common motivator for many entrepreneurs, especially family-owned-and operated businesses. With an emphasis on designing a business that has the capability of being passed down through the generations, this Model of Impact is driven by long-term planning and succession strategies."]
            impacts.append(object)
            
            object = ["name": "Peer-to-Peer Lending/Donations", "description": "Similar to crowd- funding, Peer-to-Peer Lending/Donations (also known as “P2P” Lending/Donations), the model allows a group of people to donate and/or lend money to a friend in need. Unlike crowd-funding, the P2P Lending/Donations model does not have an emphasis on the funding of entrepreneurial pursuits, but instead for crisis-oriented needs. GoFundMe."]
            impacts.append(object)
            
            object = ["name": "Commitment to Diversity", "description": "Businesses and organizations that prioritize diversity by providing equal access to opportunities, and striving for inclusivity."]
            impacts.append(object)
            
            object = ["name": "Durational Generosity", "description": "An impact model in which a business donates a large percentage of sales, profit, goods, or services, for a set period of time. Patagonia’s Black Friday Campaign."]
            impacts.append(object)
            
            object = ["name": "Gift Economy", "description": "A gift economy is a method for exchange in which goods/services are not traded or sold, but instead provided as gifts without expectation for immediate or future rewards. Burning Man."]
            impacts.append(object)
            
            object = ["name": "Incentive Prize/Competition", "description": "Competition that awards a cash (and/or other benefit) prize for the accomplishment of a feat that offers significant potential for impact, often of engineering. X-Prize."]
            impacts.append(object)
            
            object = ["name": "Parallel Offerings", "description": "A business that offers the same exact services/goods at separate locations that allow the business to reach communities of affluence, and low-income communities. Typically, the patrons of the low-income location receive the goods/services at a low cost, thanks to the more affluent location’s full-price offering serving as a subsidy to enable the discounted rates. Everytable."]
            impacts.append(object)
            
            object = ["name": "Employee-Owned Enterprise", "description": "A business that empowers its staff through the sharing of stock or equity of the business across all, or select staff members."]
            impacts.append(object)
            
            object = ["name": "Barter Economy", "description": "An exchange of goods and services for other goods and services perceived to be of equal value."]
            impacts.append(object)
            
            object = ["name": "Crowd De-Funding", "description": "A mass movement among consumers to protest or boycott to the greatest extent possible, businesses that are making a negative environmental or social impact. Public response to UBER’s Surge Pricing at the JFK airport post-travel ban."]
            impacts.append(object)
            
            object = ["name": "Round-Up for Good", "description": "An option provided by companies in the physical or digital (eCommerce) space in which consumers are given the option to round up their purchase to the nearest dollar in order to allow the company to donate the difference to a selected charity. GoDaddy."]
            impacts.append(object)
            
            object = ["name": "Pay What You Want On Top Of What We Want", "description": "An extension of the Pay What You Want Model, this model sets a base rate for a good or service, and then provides the consumer the option to pay an additional fee in order to benefit a social or environmental cause."]
            impacts.append(object)
            
            object = ["name": "Impact Investment Circles", "description": "A group of people (most commonly an official “board”) that donates to a pool of money each month in order to collectively donate or invest in a unique cause or initiative. Awesome Foundation."]
            impacts.append(object)
            
            object = ["name": "Public Services", "description": "A general impact model that is comprised of public services offered by the government to people living within its jurisdiction. The services are either offered directly to the people by way of the public sector and local initiatives/programs, or indirectly through financing provision of services. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Public Parks", "description": "The building and maintenance of public parks, most commonly by the office of parks and recreation. Public parks also include a range of more specific impact models. Consider also: Placemaking, Fitness, Economic/Community Development, and other public initiatives such as Nature and Historical Landmark Conservation/Preservation. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Unemployment Benefit", "description": "Unemployment benefits consist of public assistance and compensation for people who are currently unemployed, specifically under no fault of their own. Most commonly, this loss of job is due to layoffs or retrenchment. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Social Security:", "description": "In general, social security refers to any government system that provides monetary assistance to people with either low, or no, income. In the US, social security can refer to the assistance provided to retirees from the government. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Food Stamps", "description": "Vouchers/”stamps” that are issued by the government to low income individuals and families, exchanged for food in select stores, farmers’ markets, and restaurants. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Free WiFi/Network Access", "description": "An initiative by a local government that provides access to the internet at no cost. Free WiFi/Network Access programs are frequently launched for safety and/or convenience and recreation in public areas. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Public Safety", "description": "The priority of ensuring the wellbeing of the community, by creating institutions, initiatives and task forces that promote safety and lower crime-rates. Consider also: Military, Fire Protection, TSA/FAA, FDA/ SEC, Police, Homeland Security, Emergency Medical Services. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Foreign Relations/Diplomacy", "description": "Direct relationship management by the government with foreign governments, agencies, and institutions. The result of this relationship management, and any subsequent policy dealings and/or decisions are considered foreign relations. Most commonly foreign relations are in the interest of peace, collaboration, aid, and/or trade. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Affordable Housing Initiatives", "description": "The development or management of housing supply for community members that meet a specific profile, or showcase a specific need (most commonly evaluated based upon household income). Public Sector"]
            impacts.append(object)
            
            object = ["name": "Medicare/Medicaid", "description": "Government health care initiatives that aim to curb spending while expanding and improving access to care through additional regulations and taxes. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Transportation", "description": "The building and maintenance of public transportation including roadways as well as a diverse array of transportation modes such as light rails, buses, trains, and other vehicles. Consider also: Bike-Share Programs. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Public Broadcasting", "description": "Select channels and local news networks and television programming that is reserved for the dissemination of public information, Public Service Announcements (PSAs), and community- developed/influenced content. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Universal Healthcare", "description": "Thankyou"]
            impacts.append(object)
            
            object = ["name": "AnimalWelfare", "description": "A government program that guarantees access to fully-subsidized healthcare, typically funded and maintained through an increased tax contribution. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Public Art", "description": "Government programs that develop products/services/initiatives with the specific purpose to promote creativity and innovation for their community. This often takes the form of a public art installation (temporary or permanent), but can also be fulfilled by way of public events that celebrate the arts. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Postal Service", "description": "Also simply referred to as a Post Office, the Postal Service is a public department or corporation responsible for mail services and (in some countries) telecommunications. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Jury Service", "description": "Considered one of the highest duties of citizenship, Jury Service calls for a direct involvement in the justice system, and in the administration of justice. Jury Service is mandatory, and as a result, when a citizen is summoned for service, they must appear before the court in order to join a panel of peers. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Agricultural Subsidies", "description": "An agricultural subsidy is a governmental subsidy paid to farmers and agribusinesses to supplement their income, manage the supply of agricultural commodities, and influence the cost and supply of such commodities. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Unions", "description": "A labor union is a unified group of workers who join forces in order to increase the impact of their voice and opinions in the workplace. Unions are often formed and supported in order to increase the quality of safety and benefits in the workplace. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Common Core", "description": "A government program that mandates a set of standards in curriculum development, for use in the public class rooms in order to ensure that students are meeting predetermined criteria. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Universal Basic Income", "description": "A guaranteed income with little-to-no assumed obligations, or “strings” attached. Many believe the implementation of a Universal Basic Income, or UBI, to be necessary as automation and machine learning continues to grow and displace workers. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Veterans Administration", "description": "The Department of Veterans Affairs (also known as “VA”) exists in order to provide veterans in the United States with essential services including health care, and other benefits programs. The VA also provides access to national cemeteries for former military personnel and their immediate family (dependents). Public Sector"]
            impacts.append(object)
            
            object = ["name": "Public/Private Partnerships", "description": "Partnerships can take place in a wide range of contexts depending on the agenda and formality of the partnership. For a business, a partnership can be as formal as a split in day-to-day operations, or as informal as a one-off partnership for a product or event between two businesses, two individuals, or a business and an individual. In social enterprise, partnerships also exist between governments and organizations, governments and businesses, or organizations and businesses in order to create a program that drives social or financial impact to a community. Public Sector"]
            impacts.append(object)
           
        }
        
        
    }
    func addWord(name: String, description: String){
        //possibly check to see if already in places
        let card = [ImpactModel.key1: name, ImpactModel.key2: description]
        impacts.append(card)
    }
    
    func save() {
        print("Save to file")
        
        // save the array of dictionary objects to a plist
        (impacts as NSArray).write(toFile: filepath, atomically: true)
        
    }
    
    func numberOfWords() -> Int{
        return impacts.count
    }
    
    //return a flashcard at given index and update the current index if shouldUpdateCurrent index is true
    func word(at index: Int, shouldUpdateCurrentIndex: Bool) -> [String : String]? {
        //ensure index is valid
        if index >= 0 && index < impacts.count {
            //check to update or not
            if(shouldUpdateCurrentIndex == true) { //if they want to update. update here
                currentIndex = index
            }
            return impacts[index]
        }
        else {
            return nil //return nil if invalid index
        }
    }
    
}
