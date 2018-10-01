dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
    username = "root"
    password = "root"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
	cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
    //cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            // one of 'create', 'create-drop', 'update', 'validate', ''
//			dbCreate = "create"
			dbCreate = "update"
            url = "jdbc:mysql://localhost:3306/mcw"
            username = "root"
            password = "root"
        }
    }
    test {
        dataSource {
//			dbCreate = "create"
            url = "jdbc:mysql://localhost:3306/mcw"
            username = "root"
            password = "root"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://localhost:3306/mcw"
            username = "root"
            password = "root"
        }
    }
}