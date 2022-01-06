import UIKit
import BackgroundTasks

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        BGTaskScheduler.shared.register(forTaskWithIdentifier: "com.baegteun.isgoal", using: nil) { task in
            
        }
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        refresh()
    }
    
    private func handleAppRefresh(task: BGAppRefreshTask) {
        refresh()
        let q = OperationQueue()
        q.maxConcurrentOperationCount = 1
        
        task.expirationHandler = {
            q.cancelAllOperations()
        }
        
        AppDI.shared.getDefaultHealthRepository().fetchRecord()
        
        task.setTaskCompleted(success: true)
    }
    
    private func refresh() {
        let req = BGAppRefreshTaskRequest(identifier: "com.baegteun.isgoal")
        
        var components = Calendar.current.dateComponents([.year, .month, .day], from: Date())
        components.hour = 11
        components.minute = 30
        components.second = 0
        req.earliestBeginDate = components.date ?? .init()
        
        do{
            try BGTaskScheduler.shared.submit(req)
        }catch{
            print(error.localizedDescription)
        }
    }
    

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }


}

