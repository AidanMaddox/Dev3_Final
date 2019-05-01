//
//  BusinessModel.swift
//  Dev_Final
//
//  Created by Aidan Maddox on 4/24/19.
//  Copyright © 2019 Aidan Maddox. All rights reserved.
//

import Foundation

class BusinessModel{
    //create singleton instance
    static let shared = BusinessModel()
    
    var filepath:String
    
    //declare keys
    static let key1 = "name"
    static let key2 = "description"
    
    var keys:[String]
    private var impacts: [[String:String]] //create array of dictionary items
    var currentIndex: Int?    //Initializes currentIndex to value nil
    
    init() {
        
        keys = ["name","description"]
        impacts = [[String:String]]()
        currentIndex = 0
        
        // find the Documents directory
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        
        filepath = url!.appendingPathComponent("businessmodels.plist").path
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
            var object = ["name": "Hourly Rate", "description": "A structure for paying for a service- provider’s work. Typically when someone is working on an hourly rate, it is for a small job, or for maintenance, and an estimate of hours is provided prior to commencement."]
            impacts.append(object)
            
            object = ["name": "Day Rate", "description": "A structure for paying for a service-provider’s work. A Day Rate tends to represent 8-12 hours of work, and is most commonly used in the entertainment industry, specifically with film, photography, or editing."]
            impacts.append(object)
            
            object = ["name": "Project/Flat Rate", "description": "A structure for paying for a service- provider’s work. A Project/Flat Rate is written into an agreement which covers a set scope for a specific project or engagement in order to accomplish the goals of a project without needing to keep track of hours."]
            impacts.append(object)
            
            object = ["name": "Overages", "description": "A structure for paying for a service-provider’s work. Most commonly used in conjunction with a Project/Flat Rate, overages represent an additional billable set of hours or scope for work that was produced by a service-provider which was not included in the original scope that both parties agreed upon."]
            impacts.append(object)
            
            object = ["name": "Distributed Outsourcing", "description": "A revenue and management model leveraged by service-providers in which a client request/engagement is not physically executed by the company on contract, but instead is managed by said company, and is passed down to a network of partner companies and/or freelancing individuals."]
            impacts.append(object)
            
            object = ["name": "eCommerce", "description": "Originally short for “electronic commerce”, eCommerce is a revenue model leveraged for the sale of digital or physical products in which the transaction and customer information are being transferred over the Internet. Amazon."]
            impacts.append(object)
            
            object = ["name": "Pay What You Want", "description": "A revenue model that requires the customer to determine the perceived value of the product or service they seek to purchase. Also known as “PWYW”, the model is most commonly leveraged in the open-source software community, as well as the independent music industry, but has evolved to play a role in mainstream digital product commerce as well. RadioHead’s “In Rainbows”, ActiveHours."]
            impacts.append(object)
            
            object = ["name": "Retail Commerce", "description": "Retail Commerce is a revenue model leveraged for the sale of physical products in a physical setting. The most common industry in which retail commerce thrives (as opposed to electronic commerce) is the fashion industry as well as the sale of large machinery such as automobiles. Retail Commerce requires a sales team as well as a physical storefront. Nordstrom, Target."]
            impacts.append(object)
            
            object = ["name": "Freemium", "description": "Originally known as “crippleware”, the Freemium model offers users with multiple tiers of packages for a product, with one of those tiers always being free. Most commonly leveraged in the digital space, the free tier includes a limited amount of features, while the paid tiers offer a substantially more robust experience/suite of features. DropBox, LinkedIn."]
            impacts.append(object)
            
            object = ["name": "In-App Purchases", "description": "An In-App-Purchase is a monetary exchange, and an exchange customer information that takes place within a free or paid app in order to access more features, game levels, or content. In-App Purchases are often recognized as a mobile form of the “freemium” model Pokerist, VSCO."]
            impacts.append(object)
            
            object = ["name": "Auction", "description": "A revenue model in which one or more items are offered for sale in a public setting, or at a private event/fundraiser. Auction items will typically have a recommended price, but the eventual cost of the product is determined via the participants/guests attending the auction. Guests interested in an item will place a “bid” on an item which indicates the number they are willing to pay for the item, and the highest bidder earns the ability to complete the purchase. eBay."]
            impacts.append(object)
            
            object = ["name": "Restricted Grants", "description": "A financial award that is given (most frequently) to a non-profit organization in a “restricted” manner. This is a gift that has contingencies which explicitly determine the use-case for the award in order to fund specific programs and initiatives."]
            impacts.append(object)
            
            object = ["name": "Unrestricted Grants", "description": "A financial award that is given (most frequently) to a non-profit organization in an “unrestricted” manner. This is a gift that has no contingencies, and as a result, the recipient of said award has the freedom to invest the contribution in any program/initiative/overhead they desire."]
            impacts.append(object)
            
            object = ["name": "Donations", "description": "The giving of necessary funds, in-kind services, or goods to a non-profit organization or community cause in exchange for a charitable deduction receipt that is written off at the end of each tax year by an individual or company/collective."]
            impacts.append(object)
            
            object = ["name": "Membership/Subscription", "description": "The membership/subscription model allows an exclusive community of members and/or subscribers to earn access to recurring goods and/or services and/or access. Membership is often in reference to a physical community space whereas Subscription is often in reference to a regularly delivered set of physical products or digital products/content. For businesses, Membership/Subscription ensures recurring revenue and/or recurring engagement. Most commonly, there are multiple “tiers” that create a community which are defined by the amount of access each member/subscriber is granted as well as the amount of money the pay on a recurring basis. Loot Crate, GOOD Magazine."]
            impacts.append(object)
            
            object = ["name": "Paywall", "description": "Commonly leveraged in conjunction with the “Freemium” model, a paywall is a standardized moment in an experience, typically online, in which a user loses access to continuing their experience unless a fee is paid to the service-provider. NY Times."]
            impacts.append(object)
            
            object = ["name": "Patent Licenses", "description": "In general, licensing is the sharing of a protected invention in exchange for cash, and governed by an agreed upon set of rules/terms-of-use. When a business or an individual is granted a patent, they can elect to license the use of their invention/creation to other businesses or individuals who have products that could benefit from the innovation. Patents are granted for the design and/or utility of products and services."]
            impacts.append(object)
            
            object = ["name": "Trademark Licenses", "description": "When a business or an individual is granted a trademark, they can elect to license the use of their creation to other businesses or individuals who have products that could benefit from the content. Trademarks are granted for graphic designs, illustrations and artwork, and written copy/taglines."]
            impacts.append(object)
            
            object = ["name": "Franchise", "description": "A Franchise is a method for licensing brands, processes, and products/services in the brick-and- mortar Retail and/or Food industries most commonly. A Franchisee can open a Franchise location by paying an initial fee as well as a recurring fee or profit-share with the primary owner of the business. Subway, Taco Bell."]
            impacts.append(object)
            
            object = ["name": "SaaS", "description": "SaaS (short for “Software as a Service”) is a method for licensing and delivering centrally hosted software to users on a subscription basis. SaaS is also referred to as “on-demand software”, and the Freemium and Membership/Subscription models are similar in structure."]
            impacts.append(object)
            
            object = ["name": "Per-Use/Device Licensing", "description": "Per-Use/Device Licensing is a method of licensing in which the terms and financial commitment are determined by the amount of devices or use-cases the product will be leveraged in. For example, when purchasing a font, Graphic Designers are asked to determine the rate at checkout based on the amount of computers the font will be installed on. MyFonts.Com."]
            impacts.append(object)
            
            object = ["name": "Advertising/Advertisement", "description": "In general, advertisements are a public display/notice that aims to promote the goods and services of a business, organization, or individual. Advertisements are displayed in/on newspapers, billboards, software applications, websites, social media, and more. To receive placement, the interested party typically works with a “media buyer” in order to determine the best location/method for displaying the promotion in order to optimize the return on investment based on the demographics that inhabit the space. An advertising agency coordinates this sale as well as the development of the content and imagery to be included in the advertisement. Saatchi&Saatchi, DDB, Weiden + Kennedy."]
            impacts.append(object)
            
            object = ["name": "Event Tickets", "description": "Event Ticketing is a common revenue model leveraged across sectors and industries in the context of a celebratory event, a public/private show for entertainment purposes, and/or a fundraiser. Non-profit organizations typically host one large event per year, also known as a “gala”."]
            impacts.append(object)
            
            object = ["name": "Partnerships", "description": "Partnerships can take place in awide range of contexts depending on the agenda and formality of the partnership. For a business, a partnership can be as formal as a split in day-to-day operations, or as informal as a one-off partnership for a product or event between two businesses, two individuals, or a business and an individual. In social enterprise, partnerships also exist between governments and organizations, governments and businesses, or organizations and businesses in order to create a program that drives social or financial impact to a community."]
            impacts.append(object)
            
            object = ["name": "Affiliate Programs", "description": "A model prominent in Influencer Marketing in which an influencer/identified affiliate for a product or service’s campaign will be given a link or referral ID that allows them to make a small percentage of every sale that originates from them."]
            impacts.append(object)
            
            object = ["name": "Sponsorship", "description": "An agreement between two organizations/ businesses in which one of the organizations/businesses will sponsor/support the other via the donation of necessary good/services/cash in exchange for public recognition."]
            impacts.append(object)
            
            object = ["name": "Profit/Revenue-Share Program", "description": "An arrangement between two entities that allows them to share the profit or revenue on a pre-determined product, service, or program over an agreed upon period of time. To allow for social impact, this model is often leveraged in partnership between a non-profit/community-based cause and a business. However, this kind of program can also take place between two businesses for the sole purpose of generating more income."]
            impacts.append(object)
            
            object = ["name": "BOGOF", "description": "Buy One, Get One Free (also referred to as the BOGOF model) is a temporary/time-based promotional model in which consumers purchase one product and/ or service, and receive a second product and/or service that holds equal or lesser value to the original purchase."]
            impacts.append(object)
            
            object = ["name": "Buy One, Get One Half Off", "description": "Buy One, Get One Half Off (occasionally referred to as the BOGOHF model) is a temporary/time-based promotional model in which consumers purchase one product and/or service, and receive a second product and/or service that holds equal value to the original purchase at a 50% discount."]
            impacts.append(object)
            
            object = ["name": "Coupons", "description": "Coupons are advertisements that, when redeemed by the recipient, serve as a form of currency in order to allow the consumer to obtain a good or service for free, or for a reduced price. Coupons come in many shapes and sizes, but entered the mainstream consumer culture in the mid-20th Century. 10% Off, 25% Off, and 50% Off are examples of the kinds of discounts offered via coupons on a regular basis. Coca Cola, Valpak, The Nielsen Coupon Clearing House."]
            impacts.append(object)
            
            object = ["name": "Free Sample", "description": "Leveraged by department stores and grocery stores most commonly, Free Samples allow a consumer to obtain a small portion of a new product/ service at no cost in order to inspire them to buy-in to the full service/product offering. COSTCO."]
            impacts.append(object)
            
            object = ["name": "Wholesale Purchases", "description": "Made available via Wholesale districts, outlet malls, and bulk retail, a wholesale purchase allows a retail store or distributor to access a high quantity of goods for a rate that is discounted thanks to the bulk order."]
            impacts.append(object)
            
            object = ["name": "Cross-Subsidy", "description": "A revenue model/pricing structure in which the purchases of a consumer directly fund another product/initiative of the brand they are buying into without them realizing it. Put simply, a cross-subsidy is what happens when one thing pays for another thing. Microsoft/XBOX, Sony/PlayStation, Gillette Razors."]
            impacts.append(object)
            
            object = ["name": "Lending Circles", "description": "A lending circle is a small group of individuals who contribute a small amount of money on a monthly basis in order to build a bank of resources that the group can ultimately share with one-another. Each month, a different individual from the lending circle gains access to the capital raised by the group that month. This cycle continues until every borrower/ lender has gotten a chance to access the funds. Mexican American Opportunity Foundation (MAOF)."]
            impacts.append(object)
            
            object = ["name": "Pay-for-Performance", "description": "A revenue model in the professional services industry in which a consultant or specialist is paid a rate that directly corresponds to the success of the work’s outcome."]
            impacts.append(object)
            
            object = ["name": "Retainer (Professional Services)", "description": "A professional services agreement that secures a pre-determined amount of hours or output on a monthly, quarterly, or annual basis in order to reserve the time and ongoing efforts of a consultant."]
            impacts.append(object)
            
            object = ["name": "Tips", "description": "Typically seen in the service industry (especially in restaurants and hospitality), a tip is a bonus paid to a company’s employee directly from the consumer."]
            impacts.append(object)
            
            object = ["name": "Venture Capital (Funding Model)", "description": "Venture Capital is a method for funding and private equity in which small and early stage initiatives with high growth potential exchange equity in the business in exchange for capital and other resources from a firm."]
            impacts.append(object)
            
            object = ["name": "Angel Investment (Funding Model)", "description": "Similar to Venture Capital, Angel Investment is an exchange of equity for capital, but instead of the resources coming from a firm, the funding is provided by an individual."]
            impacts.append(object)
            
            object = ["name": "Bank Loan (Funding Model)", "description": "A funding model in which businesses and entrepreneurs can receive access to capital in exchange for an added interest or collateral guarantee to mitigate risk."]
            impacts.append(object)
            
            object = ["name": "Convertible Note (Funding Model)", "description": "A funding model in which the lender receives an equity stake in the borrower’s business as opposed to added interest."]
            impacts.append(object)
            
            object = ["name": "Boot-Strapping (Funding Model)", "description": "A funding model in which the entrepreneur or business is built upon the Founder’s savings, or other resources to allow for a successful launch."]
            impacts.append(object)
            
            object = ["name": "Friends & Family (Funding Model)", "description": "A funding model in which the business is initially financed through a trusted group of family members and friends instead of a third-party or bank."]
            impacts.append(object)
            
            object = ["name": "Royalty Fees", "description": "While a license fee is an upfront payment, a royalty fee is a recurring fee that is determined based upon a percentage of the sales or profit of the licensed item."]
            impacts.append(object)
            
            object = ["name": "Franchise", "description": "A revenue model in which a business is replicated across multiple locations by different business owners in exchange for an upfront fee and/or percentage of sales or profit. McDonald’s."]
            impacts.append(object)
            
            object = ["name": "Add-On", "description": "“Would you like fries with that?” An add-on is a sale of additional goods or services to a buyer."]
            impacts.append(object)
            
            object = ["name": "Pay-As-You-go", "description": "The pay-as-you-go business model is an option that allows the customer to pay for a resource or utility as they use it. The specific fee directly corresponds to the consumer’s relative usage of the resource or utility. T-Mobile."]
            impacts.append(object)
            
            object = ["name": "Pre-Order", "description": "A revenue and funding model in which a product or service is sold to the customer with the promise of future delivery. This model allows businesses to access capital for manufacturing costs."]
            impacts.append(object)
            
            object = ["name": "Bait-and-Switch", "description": "Typically considered a scam, bait- and-switch is a revenue model in which a customer is drawn to a product that, in reality is not of the quality that is expected, or is out-of-stock. This provides the opportunity for a sales team to provide other options that are typically provided at a higher cost to consumers."]
            impacts.append(object)
            
            object = ["name": "Pyramid Scheme", "description": "A revenue model that recruits members for a massive sales team that, in turn, recruit and enroll additional members into the scheme in exchange for shared commission."]
            impacts.append(object)
            
            object = ["name": "Commission", "description": "An agreement in which an individual or business is compensated in exchange for finding and securing new business opportunities for another business or individual."]
            impacts.append(object)
            
            object = ["name": "Cost Cutting", "description": "Building revenue by cutting costs from improved resource and operational efficiency."]
            impacts.append(object)
            
            object = ["name": "Indirect Benefit/Profit Sharing", "description": "Sharing a percentage of profits generated by environmental restoration efforts or sustainable actions. For example, property prices go up in an area where the environment has been restored. The service provider who restores the surrounding environment can share this increase in future property prices."]
            impacts.append(object)
            
            object = ["name": "Secondary Revenue/Revenue from Byproducts", "description": "Generating revenue from reselling/ upcycling scrap, byproducts or waste. Or even perhaps by offering consulting services around the product/service company’s best practices."]
            impacts.append(object)
            
            object = ["name": "B2B (Business to Business)", "description": "A general model of business in which all transactions and product/services are designed to be made directly from one business to another business."]
            impacts.append(object)
            
            object = ["name": "Social Enterprise (Non-Profit)", "description": "For a non-profit organization, the leverage of social enterprise is distinctive from traditional financial and operational strategies as it allows the organization to design unique methods for revenue generation that think beyond the traditional avenues of grant-making and/or fundraising campaigns and public donation requests."]
            impacts.append(object)
            
            object = ["name": "Social Enterprise (For-Profit)", "description": "For a for-profit company, social enterprise is an opportunity to make giving back a priority for a business and a brand. As a result, a for- profit social enterprise is a business that hold profit and impact in the same regard/metric for success. verynice defines a social enterprise as a business that focuses at least half of its time/energy on impact."]
            impacts.append(object)
            
            object = ["name": "Products", "description": "A general focus-area for a business’ key offering which takes the form of a physical or digital product. A physical product requires shipment and manufacturing. A digital product is typically a piece of software (like a native or web app). Products are differentiated from Services in their ability to be replicable/passively distributed to consumers."]
            impacts.append(object)
            
            object = ["name": "Benefit Corporation", "description": "A benefit corporation is a new class of corporation that voluntarily meets the different standards of corporate purpose, accountability, and transparency."]
            impacts.append(object)
            
            object = ["name": "Non-Profit Organization", "description": "A non-profit organization is an organization that holds a tax-exempt status due to its proven ability to further a religious, charitable, scientific, literary, educational, public safety, amateur sports, or cruelty prevention purpose. The organization must also provide a public benefit. Non-profit organizations survive with a model that relies on grants, public fundraising campaigns, and/or private donations. The American Red Cross, Amnesty International, Human Rights Campaign, National Resource Defense Council."]
            impacts.append(object)
            
            object = ["name": "Hybrid Organizations", "description": "A hybrid organization is an organization that mixes elements, value systems and action logics of various sectors of society. Many of the models featured here would be considered “hybrid.” Hewlett-Packard Company Foundation, Greystone Foundation."]
            impacts.append(object)
            
            object = ["name": "Services", "description": "A general focus-area for a business’ key offering which takes the form of a time-based/skills- based engagement/experience. Most commonly, services are offered in the form of consulting or home improvement/repairs. Services are differentiated from Products in their in-ability to be passively distributed to consumers. As a result, each engagement greatly differs from the previous."]
            impacts.append(object)
            
            object = ["name": "B2C (Business to Consumer)", "description": "A general model of business in which all transactions and product/services are designed to be made directly from a business to a consumer."]
            impacts.append(object)
            
            object = ["name": "Parking Permits", "description": "In certain communities, the availability of parking is limited to those who purchase a parking permit on either a monthly, or annual basis. These permits may be acquired to allow for overnight parking, parking an oversized vehicle, or other circumstances. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Parking Tickets", "description": "A citation issued by parking enforcement for illegally parked vehicles. The citation is most commonly attached to a car windshield, and parking tickets often generate significant income for a city. For example, in 2013, Chicago made close to $176 million from parking violations. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Citations (General)", "description": "In general, a citation, is a notice to pay a fine, or to appear in court due to a conflict with the law, or with posted signage. Citations may be received for a traffic or ordinance violation, such as the Sit/lie ordinance. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Rent (Real Estate)", "description": "Income generated by leasing government-owned property to individuals, businesses, and/or developers and other institutions. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Restricted Grants", "description": "This is a gift that has contingencies which explicitly determine the use-case for the award in order to fund specific programs and initiatives. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Unrestricted Grants", "description": "A financial award that is given in an “unrestricted” manner. This is a gift that has no contingencies, and as a result, the recipient of said award has the freedom to invest the contribution in any program/initiative/overhead they desire. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Permits (Fees)", "description": "In general, a permit, is sold and made available to individuals or businesses by a government in order to give authorization or consent to do something. This may take the form of a warrant, a certification, a sanction, or a license. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Income Tax (Corporate)", "description": "Tax levied by a government directly on the income of a corporation, especially an annual tax on money earned, after standard and legal deductions from the cost of doing business, or charitable donations. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Income Tax (Individual)", "description": "Tax levied by a government directly on the income of an individual or household, especially an annual tax on money earned, after standard and legal deductions (including charitable donations, equipment, etc.). Public Sector"]
            impacts.append(object)
            
            object = ["name": "Payroll Tax", "description": "Taxes imposed on employers that are most commonly calculated based upon a percentage of an employee’s salary. Payroll taxes often consist of both a deduction from an employee’s wage as well as an additional contribution from an employer, based on the employee’s wage. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Property Tax", "description": "Tax levied by a government that the owner of a property (individual or business) is required to pay. The tax itself is levied by the governing authority of the jurisdiction in which the property happens to be located. As a result, this may take the form of a payment to a national, regional, state, or other geographic region. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Motor Vehicle License Tax", "description": "Based on the sale price of a vehicle, A motor vehicle license tax is assessed at the time of initial registration, and is continued to be paid annually. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Sales and Gross Receipts Tax", "description": "Tax on the sale of physical goods. Typically the law requires that the seller of the good collects the taxes from the buyer at the point of purchase. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Printing Money", "description": "Governments are the only institutions allowed to legally create currency, and print money. As a revenue model, printing money allows for the creation of new currency at-will. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Excise Tax", "description": "Like a sales tax, an excise tax is paid in conjunction with the purchase of a physical good. However, an excise tax is often included in the price of a specific product (like gasoline, cigarettes, alcohol, etc.), and as a result is an indirect tax. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Water, Power, Utilities", "description": "Most commonly, fees for water, power, or other utilities, are paid to the government on a monthly or bi-monthly basis in exchange for necessary resources. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Prison Labor", "description": "Many public prisons require prisoners to participate in prison labor programs. As a result, governments are able to obtain access to low-or-no wage workers. The captive laborers are then “leased” in order to obtain revenue from businesses seeking the assistance of such laborers. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Asset Sales", "description": "The sale of goods owned by the government. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Privatization", "description": "When a government program is privatized, the program is sold to a new owner/ operator, specifically an owner in the private sector, who becomes responsible for the management of the service, and who is capable of earning profit from its operations. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Toll Roads", "description": "The opposite of freeways, a toll road (also known as a turnpike or a tollway) is a road that drivers are required to pay in order to use/traverse. Revenue generated from toll roads is most commonly leveraged to help cover the cost of construction and maintenance. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Civic Incubator Programs", "description": "Programs within local or federal government that invite staff and/or social/ private sector partners to develop new solutions for government initiatives. While the solutions often contribute to the impact model of a government, they may also include approaches to minimizing cost, or generating income. 18F, Code for America, WeHoX. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Special Event Services", "description": "The use of government land/ property for special events, or the use of government resources and staff for the facilitation and production/ assurance of safety for a special event. Public Sector"]
            impacts.append(object)
            
            object = ["name": "G2B (Government-to-Business)", "description": "A general model of business/collaboration/partnership in which all transactions and product/services are designed to be made directly from one business to another government (or vice-versa). Public Sector"]
            impacts.append(object)
            
            object = ["name": "Legalization and Regulation", "description": "The legalization and regulation of any former vice that then become legal and taxable. For example, should marijuana be legalized in the United States, the associated taxes and growing licenses are estimated to generate as much as $28 Billion in revenue. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Policeteering", "description": " In “Police Shootings Won’t Stop Unless We Also Stop Shaking Down Black People”, author Jack Hitt sheds light on a revenue generating tactic leveraged by police forces in which citations are often given at an increased rate in low-income communities. According to Hitt, this is due to an increased chance of community members being incapable of paying the citation on time, thus leading to even more fees (and revenue) for the singular incident. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Waste Management", "description": "The process, and management of all activities required to dispose of garbage, sewage, and all other waste products. Waste Management includes the collection, transportation, and treatment of these waste products for a fee. Consider also: Recycling (26a), Industrial Composting (26b). Public Sector"]
            impacts.append(object)
            
            object = ["name": "Corruption", "description": "Usually associated with individuals, and not with institutions themselves. Examples include cronyism, kickbacks, in-kind favors/ quid pro quo, etc. Crony capitalism is a term describing an economy in which success in business depends on close relationships between business people and government officials. It may be exhibited by favoritism in the distribution of legal permits, government grants, special tax breaks, or other forms of state interventionism. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Natural Resource Sales and Services", "description": "The sale of natural resources. For example, a petrodollar is a form/unit of currency that is earned by a country from the export of petroleum. There are numerous occasions of water and natural gas permits being issued in or adjacent to National Parks. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Transient Occupancy Tax", "description": "Charged in most states, a transient occupancy tax takes place when a traveler is renting an accommodation. These accommodations may include a room, rooms, or entire home/other living space in a hotel, inn, or other place of lodging. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Issuing Bonds", "description": "Governments and borrowers issue bonds in order to raise money from investors who are willing to lend them money for a set period of time. Bonds are similar to an “IOU”, a form of debt security. Public Sector"]
            impacts.append(object)
            
            object = ["name": "Adoption", "description": "A public initiative that allows businesses, individuals, organizations, or community groups to become sponsors of a specific section of a roadside within the highway system, sections of a stream, or sections of other public spaces. In an adopt-a-mile program, for example, there is a financial exchange in which the sponsor receives advertisement placement in the roadside section they choose to sponsor. Public Sector"]
            impacts.append(object)
        
        }
        
        
    }
    func addWord(nameT: String, descriptionT: String){
        //possibly check to see if already in places
        var card = [BusinessModel.key1: nameT, BusinessModel.key2: descriptionT]
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
