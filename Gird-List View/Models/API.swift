import UIKit

struct ApiDetails {
    static let apiKey = "72de231228d14daf863b73ad0aae43e0";
}

    let apiUrl = URL(string : "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey="+ApiDetails.apiKey);
