# SixtTestCore

A description of this package.
Base tools for project, as extensions, base architecture classes and protocols and general networking layer

- Application Layer
    - Base  
        1. AppCoordinating
        2. CoordinatorObject
        3. EventHandling
        4. NavigationEventHandling
        5. State Machine
    - Infrastructure Layer
        - Extensions
            1. JSONDecoder+Networking
            2. MKCoordinateRegion+CLLocationCoordinate2D
            3. String+FileName
            4. String+Localization
            5. URL+Networking
            6. URLRerquest+Encoding
            7. View+Navigation
        - Networking
            - Core
                - Providers
                    1. MockProvider
                    2. NetworkProvider
                1. Endpoint
                2. NetworkTask
                3. NetworkProvider
                4. NetworkValidation
                5. TargetType
            - Entities
                1. AnyEncodable
                2. HTTPMethod
                3. NetworkError
            - Helpers
                1. ResponseValidator
                2. TargetToEndpointMapper
            - Protocols
                1. URLRequestConvertible
            1. NetworkingService
        - Services
            1. ServiceLocator
            2. WeakContainer
    - Resources
       1.  Localizable.strings(en + uk)
