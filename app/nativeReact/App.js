import {AuthProvider} from "./Contexts/auth";
import Route from "./Router/Route";

export default function App() {
  return (
      <AuthProvider>
          <Route/>
      </AuthProvider>
  );
}
